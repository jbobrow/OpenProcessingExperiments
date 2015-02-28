
class Beat {
    String lyric;
    float duration;
    Beat(String ly, float du) {
        lyric = ly;
        duration = du;
    }
}

class Lyrics {
    Beat[] lyrics;
    
    Lyrics(Beat[] ly) {
        lyrics = ly;
    }
    
    Lyrics() {
        lyrics = new Beat[];
    }
    
    String toString() {
        String lyricString = '';
        for(i = 0; i < lyrics.length; i++) {
            lyricString = lyricString + lyrics[i].lyric;
        }
        return lyricString;
    }
}

Beat beat(String ly, float du) {
    return new Beat(ly, du);
}

Beat[] beats = {
        beat("In ",    1/8),
        beat("the ",   1/8),
        beat("mor",    1/4),
        beat("ning, ", 1/4),
        beat("Git",    1/4),
        beat("mo ",    1/4),
        beat("Na",     1/4),
        beat("tion",   1/2)
    };

println beats.length;
for(i = 0; i < beats.length; i++) {
    println beats[i].lyric;
}
/*
Lyrics song = new Lyrics(beats);

println("Anthem\n------\n");
println(song.toString());
*/
