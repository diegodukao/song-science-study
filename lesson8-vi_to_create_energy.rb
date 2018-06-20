# Deprive Listener of a Minor Sound
# (half section and whole section)

I = 1
ii = 2
iii = 3
IV =4
V = 5
vi = 6

use_synth :piano

type = :major
key = :c3
define :spc do |degree, note_duration|
  play (chord_degree degree, key, type, 3),
    sustain: note_duration, release: note_duration
  sleep note_duration
end

define :spp do |song_data|
  song_data.each do |degree_time|
    spc degree_time[0], degree_time[1]
  end
end

# Half of Section
startofsomenthingnew = [
  [I, 2],
  [IV, 2],
  [I, 2],
  [IV, 1],
  [V, 1],
  [vi, 2],
  [V, 2],
  [IV, 2],
  [V, 2],
]

# Whole Section
benfoldsfivebrick = [
  # verse
  [I, 2],
  [IV, 2],
  [I, 2],
  [IV, 2],
  [I, 2],
  [IV, 2],
  [I, 2],
  [IV, 2],
  # pre chorus
  [vi, 2],
  [IV, 2],
  [vi, 2],
  [IV, 2],
]

live_loop :chords do
  spp benfoldsfivebrick
end
