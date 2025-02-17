require 'swagger_helper'

RSpec.describe 'api/v1/ledgers', type: :request do

  path '/api/v1/assets' do

    get('assets ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/revenues' do

    get('revenues ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/liabilities' do

    get('liabilities ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/equities' do

    get('equities ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/accounts' do

    get('accounts ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/entries' do

    get('entries ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/amounts' do

    get('amounts ledger') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/add_entry' do

    post('add_entry ledger') do
      consumes 'application/json'
      parameter name: :ledger, in: :body, schema: {
          type: :object,
          properties: {
              description: { type: :string },
              date: { type: :string, pattern: '^\d{4}-\d{2}-\d{2}$' },
              debits: {
                  type: :array,
                  items: {
                      type: :object,
                      properties: {
                          account_name: {type: :string},
                          amount: { type: :number, multipleOf: 0.1 }
                      }
                  }

              },
              credits: {
                  type: :array,
                  items: {
                      type: :object,
                      properties: {
                          account_name: {type: :string},
                          amount: { type: :number, multipleOf: 0.1 }
                      }
                  }

              }
          },
          required: [ 'description', 'date', 'debits', 'credits' ]
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/account_balance' do

    get('account_balance ledger') do
      consumes 'application/json'
      parameter in: :query,
                name: :account_name,
                type: :string,
                schema: {
                    type: :string,
                },
                description: "Asset name"
      parameter in: :query,
                name: :from_date,
                schema: { type: :string, pattern: '^\d{4}-\d{2}-\d{2}$'},
                description: "date in dddd-dd-dd format"
      parameter in: :query,
                name: :to_date,
                schema: { type: :string, pattern: '^\d{4}-\d{2}-\d{2}$'},
                description: "date in dddd-dd-dd format"
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
              'application/json' => {
                  example: JSON.parse(response.body, symbolize_names: true)
              }
          }
        end
        run_test!
      end
    end
  end
end
