
/**
 * Canvas Audio Test ProcessingJS
 * A simple proof-of-concept of AudioAPI capabilities
 * Takes as input user microphone and displays the sound wave in screen
 * Copyright (c) Ale, 2014
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation, version 2.1.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA
 */

/**
 * Setting up audio
 */
 
// Fork getUserMedia for multiple browser versions, for those that need prefixes.
navigator.getUserMedia = (navigator.getUserMedia ||
                          navigator.webkitGetUserMedia ||
                          navigator.mozGetUserMedia ||
                          navigator.msGetUserMedia ||
                          navigator.oGetUserMedia );
 
// Set up forked web audio context, for multiple browsers 'window.' is needed, otherwise Safari explodes.
var ctxClass = ( window.AudioContext ||
                 window.webkitAudioContext ||
                 window.mozAudioContext ||
                 window.oAudioContext ||
                 window.msAudioContext );
 
if(ctxClass) var audioCtx = new ctxClass(); else alert("Oops. Your browser doesn't support Audio Context.");
 
//Setting up the stuff needed to the analysis of sound
var analyser = audioCtx.createAnalyser();
analyser.fftSize = 256;
var samples = analyser.frequencyBinCount;
var dataArray = new Uint8Array(samples);

 
/**
 * Checks whether getUserMedia() is available and if so, launches the animation.
 */
 
if (navigator.getUserMedia)
{
    navigator.getUserMedia ({ audio: true },
    // Success callback
    function(stream)
    {
        source = audioCtx.createMediaStreamSource(stream);
        source.connect(analyser);
    },
    // Error callback
    function(error)
    {
        console.log('The following error occured: '+error);
    }
    );
} else { console.log('Ooops. getUserMedia() is not supported on your browser!'); }
 
 
/**
 * Main animation
 */
 
var y, offset, o2, f, padding;

void setup()
{
    size(1200, 600);
    noFill();
    stroke(0, 50);
    y = height / 2;
    padding = 100;
    offset = (width - padding * 2) / samples;
    o2 = padding + offset/2;
    f = 2000/255;
}
 
void draw()
{
    background(-1);
    analyser.getByteTimeDomainData(dataArray);
    for(var i = 0, x = o2; i < samples; i++, x += offset)
    {
        var r = abs(dataArray[i] * f - 1000);
        ellipse(x, y, r, r);
    }
}

//Giving style to the canvas
parent.document.getElementById("appletAjaxContainer").setAttribute(
    "style", 
    "border: none; max-width: 1200px;");

 
