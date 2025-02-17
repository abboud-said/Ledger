class Api::V1::LedgersController < ApplicationController
  skip_forgery_protection

  def assets
    render json: Plutus::Asset.all
  end

  def revenues
    render json: Plutus::Revenue.all
  end

  def liabilities
    render json: Plutus::Liability.all
  end

  def equities
    render json: Plutus::Equity.all
  end

  def accounts
    render json: Plutus::Account.all
  end

  def entries
    render json: Plutus::Entry.all
  end

  def amounts
    render json: Plutus::Amount.all
  end

  def add_entry
    entry = Plutus::Entry.new(ledger_params)
    if entry.save
      render json: entry
    else
      render json: entry.errors, status: :internal_server_error
    end
  end

  def account_balance
    if params[:account_name]
      account = Plutus::Asset.find_by_name(params[:account_name])
      if params[:from_date] && params[:to_date]
        balance = account.balance(:from_date => params[:from_date], :to_date => params[:to_date])
      else
        balance = account.balance
      end
      render json: account.balance
    else
      render json: Plutus::Asset.balance
    end
  end

  private
  def ledger_params
    # we construct a strong parameters whitelist below
    # require(:post) means that the `params` hash MUST contain a :post key
    # permit(:title, :body, ...) = here we enumerate the attributes which we will accept from the form parameters; it acts as a whitelist
    params.require(:ledger).permit(:description, :date, :debits =>[ :account_name, :amount ], :credits => [ :account_name, :amount ])
  end
end