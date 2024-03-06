# Copyright (C) 2012-2024 Antonio Nardella, https://linkfree.antonionardella.it

class CheckMkIntegration2 < ActiveRecord::Migration[6.2]
  def up

    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')
    
    Setting.create_if_not_exists(
      title:       'Fallback Customer',
      name:        'check_mk_fallback_customer_id',
      area:        'Integration::CheckMK',
      description: 'Defines the fallback customer of created tickets.',
      options:     {
        form: [
          {
            display:  '',
            null:     false,
            name:     'check_mk_fallback_customer_id',
            tag:      'select',
            relation: 'Customer',
          },
        ],
      },
      state:       1,
      preferences: {
        prio:       3,
        permission: ['admin.integration'],
      },
      frontend:    false
    )
  end
end
