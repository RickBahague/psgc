psgc
====

The Philippine Standard Geographic Code (PSGC) provides the standard code for geographic areas of the Philippines
that rationalizes and integrates different existing geographic codes being used by various government agencies.

It is published and maintained by the National Statistics Coordination Board at:
http://nap.psa.gov.ph/activestats/psgc/

This Ruby gem provides the PSGC data as a Ruby class library. It can be used in Rails applications without requiring dedicated database tables.

Additionally, this gem provides Rake tasks to import the PSGC data from the URL above.

## Usage

#### Show all rake tasks

```
rake -T
```

#### Import data from ncsb.gov.ph

```
rake psgc:import
```

Afterwards, you should see CSV files under `data/`.

For example, to see the list of regions, see `data/regions.csv`.

For the provinces under Region I, see `data/1/provinces.csv`, and so on.

## Contributing to psgc

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Alistair A. Israel. See LICENSE.txt for further details.
