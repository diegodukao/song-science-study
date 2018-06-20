# Add minor sound with vi
# (use after I or before/after IV)

I = 1
ii = 2
iii = 3
IV =4
V = 5
vi = 6

define :pc do |degree, key, type, note_duration|
  play (chord_degree degree, key, type, 3),
    sustain: note_duration, release: note_duration
  sleep note_duration
end

define :pp do |song_data|
  key = song_data[0]
  type = song_data[1]
  degrees_list = song_data[2]
  note_duration = song_data[3]
  
  degrees_list.each do |degree|
    pc degree, key, type, note_duration
  end
end

justinbieber = [:c3, :major, [I, vi, IV, V], 4]
fourfiveseconds = [:c3, :major, [I, IV, vi, V], 2]  # bpm 60
edgeofglory = [:c3, :major, [I, V, vi, IV], 2]


live_loop :chord do
  use_bpm 60
  use_synth :piano
  pp edgeofglory
end
