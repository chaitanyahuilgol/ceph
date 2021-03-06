  $ crushtool --help
  usage: crushtool ...
  
  Display, modify and test a crush map
  
  There are five stages, running one after the other:
  
   - input/build
   - tunables adjustments
   - modifications
   - display/test
   - output
  
  Options that are not specific to a stage.
  
     [--infn|-i infile]
                           read the crush map from infile
  
  Options for the input/build stage
  
     --decompile|-d map    decompile a crush map to source
     [--outfn|-o outfile]
                           specify output for for (de)compilation
     --compile|-c map.txt  compile a map from source
     --enable-unsafe-tunables compile with unsafe tunables
     --build --num_osds N layer1 ...
                           build a new map, where each 'layer' is
                             'name (uniform|straw|list|tree) size'
  
  Options for the tunables adjustments stage
  
     --set-choose-local-tries N
                           set choose local retries before re-descent
     --set-choose-local-fallback-tries N
                           set choose local retries using fallback
                           permutation before re-descent
     --set-choose-total-tries N
                           set choose total descent attempts
     --set-chooseleaf-descend-once <0|1>
                           set chooseleaf to (not) retry the recursive descent
     --set-chooseleaf-vary-r <0|1>
                           set chooseleaf to (not) vary r based on parent
  
  Options for the modifications stage
  
     -i mapfn --add-item id weight name [--loc type name ...]
                           insert an item into the hierarchy at the
                           given location
     -i mapfn --update-item id weight name [--loc type name ...]
                           insert or move an item into the hierarchy at the
                           given location
     -i mapfn --remove-item name
                           remove the given item
     -i mapfn --reweight-item name weight
                           reweight a given item (and adjust ancestor
                           weights as needed)
     -i mapfn --reweight   recalculate all bucket weights
  
  Options for the display/test stage
  
     --tree                print map summary as a tree
     --check [max_id]      check if any item is referencing an unknown name/type
     -i mapfn --show-location id
                           show location for given device id
     -i mapfn --test       test a range of inputs on the map
        [--min-x x] [--max-x x] [--x x]
        [--min-rule r] [--max-rule r] [--rule r] [--ruleset rs]
        [--num-rep n]
        [--batches b]      split the CRUSH mapping into b > 1 rounds
        [--weight|-w devno weight]
                           where weight is 0 to 1.0
        [--simulate]       simulate placements using a random
                           number generator in place of the CRUSH
                           algorithm
     --show-utilization    show OSD usage
     --show utilization-all
                           include zero weight items
     --show-statistics     show chi squared statistics
     --show-mappings       show mappings
     --show-bad-mappings   show bad mappings
     --show-choose-tries   show choose tries histogram
     --output-name name
                           prepend the data file(s) generated during the
                           testing routine with name
     --output-csv
                           export select data generated during testing routine
                           to CSV files for off-line post-processing
                           use --help-output for more information
  
  Options for the output stage
  
     [--outfn|-o outfile]
                           specify output for for modified crush map
  
  $ crushtool --help-output
  data output from testing routine ...
            absolute_weights
                  the decimal weight of each OSD
                  data layout: ROW MAJOR
                               OSD id (int), weight (int)
             batch_device_expected_utilization_all
                   the expected number of objects each OSD should receive per placement batch
                   which may be a decimal value
                   data layout: COLUMN MAJOR
                                round (int), objects expected on OSD 0...OSD n (float)
             batch_device_utilization_all
                   the number of objects stored on each OSD during each placement round
                   data layout: COLUMN MAJOR
                                round (int), objects stored on OSD 0...OSD n (int)
             device_utilization_all
                    the number of objects stored on each OSD at the end of placements
                    data_layout: ROW MAJOR
                                 OSD id (int), objects stored (int), objects expected (float)
             device_utilization
                    the number of objects stored on each OSD marked 'up' at the end of placements
                    data_layout: ROW MAJOR
                                 OSD id (int), objects stored (int), objects expected (float)
             placement_information
                    the map of input -> OSD
                    data_layout: ROW MAJOR
                                 input (int), OSD's mapped (int)
             proportional_weights_all
                    the proportional weight of each OSD specified in the CRUSH map
                    data_layout: ROW MAJOR
                                 OSD id (int), proportional weight (float)
             proportional_weights
                    the proportional weight of each 'up' OSD specified in the CRUSH map
                    data_layout: ROW MAJOR
                                 OSD id (int), proportional weight (float)
