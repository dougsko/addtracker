#!/usr/bin/env ruby
#
# adds http://tracker.publicbt.com to a torrent
#
require 'bencode'

class Addtracker
    def initialize(torrent_file, tracker)
        @torrent_file = torrent_file
        @tracker = tracker
        t = BEncode.load_file(@torrent_file, 
                              opts = {:ignore_trailing_junk => true})
        t['announce-list'] << [@tracker]
        File.open(@torrent_file, 'w') do |f|
            f.puts t.bencode
        end
    end
end
