# The Cadence Chord (IV or V)

I = 1
ii = 2
iii = 3
IV =4
V = 5
vi = 6

define :pc do |degree, key, type, note_duration|
  play (chord_degree degree, key, type, 3),
    sustain: note_duration
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

adele = [:c4, :major, [I, V, vi, IV], 2]
jessiej = [:f3, :major, [I, iii, vi, IV], 3]
bonnietyler = [:f3, :major, [I, vi, IV, V], 2]  # vi should be lower

# short vs long progressions
jasonmraz = [:f3, :major, [I, V, vi, IV], 2]
greenday = [:g3, :major, [I, V, vi, iii, IV, I, V, V], 2]


live_loop :chord do
  use_bpm 70
  use_synth :piano
  pp greenday
end
