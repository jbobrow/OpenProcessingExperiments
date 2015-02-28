
/*

//MAIN:

import minim;
import sonia;
import other libraries;

int tempo;
array[] sounds; 

//sounds[] will be a list of frequencies. Lower frequencies closer to 0,
//higher frequencies closer to sounds.length

// OR

// a trickier solution..  might need to make an array of arraylists. Each frequency
// will correspond to an index in the array (0 == low frequency / sounds.length == high frequency). 
// I will then have to append sounds to the array corresponding to the correct index. 
// This will store all sounds until user decides to clear them.

setup() {
    make GUI (circle visuals / sliders);
    initialize recorder class;
    initialize player class;
    tempo = tempo;
    sounds = new sounds[]; 

}

draw() {
    get current tempo;
    record sounds to recorder(sounds[], tempo);
    play sounds from player(sounds[], tempo);
}

mouseDragged() {
    //via sliders
    change tempo; 
    change volume;
    add filter;
    }
}



//Audio player class

import libraries

class player {
    int tempo;
    array[] sounds;

player(int tempo, array[] sounds) {
    this.tempo = tempo;
    this.sounds = sounds;
}

playAudio() {
    // still haven't figured out how to play multiple sounds in time...
    // this is going to be the trickiest part of the project I can already tell.

    parse through existing beat making code that utilizes multiple tracks
    and figure out an algorithm to make it work.

    low frequencies = beats 1  and 3
    mid frequencies = beats 2 and 4
    higher frequencies = 1.5, 2.5, 3.5 etc.
    higher than that = higher and higher subdivisions
    include other frequencies at longer periods in 3/4 to create variation
}
}




//Audio recorder class


import libraries

class recoder {
    int tempo;
    array[] sounds;

recorder(int tempo, array[] sounds) {
    this.tempo = tempo;
    this.sounds = sounds;
}

getAudio() {
    //sounds[] will be a list of frequencies. Lower frequencies closer to 0,
    //higher frequencies closer to sounds.length
    
    sound = minim.getSound();
    frequency = minim.getFrequency(sound);

    // I need to find a way to convert frequencies to a digit code that will        // correspond to indexes in the sounds arrays
    frequency = changeIntoInt(frequency);

    //length of sound will be defined by the tempo
    sound = changeSoundLength(tempo, sound);

    for(int i = 0; i < sounds.length; i++) {
        if (frequency == i) {
            sounds(i).add(sound);
        }
    }
}


*/
                    
