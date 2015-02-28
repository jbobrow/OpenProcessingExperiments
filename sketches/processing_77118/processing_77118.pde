
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[2];
console.log(csslink);
csslink.parentNode.removeChild(csslink);
var style = document.getElementsByTagName("style")[0];
style.parentNode.removeChild(style);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an iframe

/////////////////////////////////AUDIO API FUNCTIONS
// create the audio context (chrome only for now)
var context;
var audioBuffer;
var sourceNode;
var splitter;
var analyser, analyser2;
var javascriptNode;

function setupAudioNodes() {
    // setup a javascript node
    javascriptNode = context.createJavaScriptNode(2048, 1, 1);
    // connect to destination, else it isn't called
    javascriptNode.connect(context.destination);

    // when the javascript node is called
    // we use information from the analyzer node
    // to draw the volume
    javascriptNode.onaudioprocess = function() {

        // get the average for the channel
        var array = new Uint8Array(analyser.frequencyBinCount);
        analyser.getByteFrequencyData(array);
        var average = getAverageVolume(array);

        // send value to Processing
        analyzeVolume(average);
    }

    // setup a analyzer
    analyser = context.createAnalyser();
    analyser.smoothingTimeConstant = 0.3;
    analyser.fftSize = 1024;

    // create a buffer source node
    sourceNode = context.createBufferSource();
    splitter = context.createChannelSplitter();

    // connect the source to the analyser and the splitter
    sourceNode.connect(splitter);

    // connect one of the outputs from the splitter to
    // the analyser
    splitter.connect(analyser,0,0);

    // connect the splitter to the javascriptnode
    // we use the javascript node to draw at a
    // specific interval.
    analyser.connect(javascriptNode);

    // and connect to destination
    sourceNode.connect(context.destination);
}

// load the specified sound
function loadSound(url) {
    var request = new XMLHttpRequest();
    request.open('GET', url, true);
    request.responseType = 'arraybuffer';

    // When loaded decode the data
    request.onload = function() {

        // decode the data
        context.decodeAudioData(request.response, function(buffer) {
            // when the audio is decoded play the sound
            playSound(buffer);
        }, onError);
    }
    request.send();
}

function playSound(buffer) {
    sourceNode.buffer = buffer;
    sourceNode.noteOn(0);
}

// log if an error occurs
function onError(e) {
    console.log(e);
}

function getAverageVolume(array) {
    var values = 0;
    var average;

    var length = array.length;

    // get all the frequency amplitudes
    for (var i = 0; i < length; i++) {
        values += array[i];
    }

    average = values / length;
    return average;
}



/////////////////////////////////PROCESSING SKETCH

ArrayList<Arc> arcs;
ArrayList<Arc> arcs2;
int mode;
boolean deux;
boolean rnd;
boolean musicLoaded=false;
int fadeTimer;
PImage logo;

void setup() {
    size(1000, 700, P2D);
    smooth();
    strokeCap(SQUARE);
    deux=false;
    rnd=true;
    fadeTimer=0;
    logo = loadImage("http:///makio.free.fr/divers/logo.png");
    imageMode(CENTER);

    
  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  context = new AudioContext();
  
  // load the sound
    setupAudioNodes();
    loadSound("Fatbros.ogg");//uploaded inside zip file via openProcessing "upload from processing"
}

void draw() {
    externals.context.clearRect(0,0,width,height);// part of the canvasAPI that creates a clear rect
    //background(255);
    
    if(musicLoaded){
        for (int i=0;i<arcs.size();i++) {
            Arc a = (Arc) arcs.get(i);
            pushMatrix();
            if (deux) {
                translate(3*width/4, height/2);
                scale(.7);
            }
            else { 
                translate(width/2, height/2);
                scale(1);
            }
            switch(mode) {
            case 0:
                a.draw();
                break;
            case 1:
                a.anime1();
                break;
            case 2:
                a.anime2();
                break;
            case 3:
                a.anime3();
                break;
            case 4:
                a.anime4();
                break;
            case 5:
                a.anime5();
                break;
            }
            popMatrix();
            if (deux) {
                Arc b = (Arc) arcs2.get(i);
                pushMatrix();
                translate(width/4, height/2);
                scale(.7);
                switch(mode) {
                case 0:
                    b.draw();
                    break;
                case 1:
                    b.anime1();
                    break;
                case 2:
                    b.anime2();
                    break;
                case 3:
                    b.anime3();
                    break;
                case 4:
                    b.anime4();
                    break;
                case 5:
                    b.anime5();
                    break;
                }
                popMatrix();
            }
        }

        fadeTimer++;
        if(fadeTimer>300){
            fadeOut();
        }
    }
    else{
        fill(0);
        textAlign(CENTER);
        int t=int(frameCount/30)%4;
        text((t==0)?"LOADING":
             (t==1)?"LOADING.":
             (t==2)?"LOADING..":
             "LOADING...",width/2,height/2);
    }
}

int al=0, al2=255;
void fadeOut() {
    fill(0,al);
    noStroke();
    rect(0, 0, width, height);
    if(al<255) al++;
    if(al>=255){
        if(logo.width>1) image(logo,width/2,height/2);
        if(al2>0){
            al2--;
            fill(0,al2);
            rect((width-800)/2, (height-600)/2, 800,600);
        }
    }
}

void generateArcs() {
    fadeTimer=0;
    al=0;
    if (rnd) deux=random(1)>.3 ? deux : random(1)>.5;
    mode=(int) random(1, 6);
    arcs = new ArrayList<Arc>();
    arcs2 = new ArrayList<Arc>();

    int nbEllipses;
    for (int k=0; k<2; k++) {
        nbEllipses = (int) random(3, 9);
        for (int j=0; j<nbEllipses; j++) {
            arcs.add(new Arc(j));
            arcs2.add(new Arc(j));
        }
    }
}

void setRandom(){
    rnd=!rnd;
}

float ease(float variable, float target, float easingVal) {
    float d = target - variable;
    if (abs(d)>1) variable+= d*easingVal;
    return variable ;
}

// float maxA=0;
float vol, pvol;
void analyzeVolume(float a){
    // test to get max value
    /*
    if(a>maxA){
        maxA=a;
        println("maxA: "+maxA);
    }
    */
    if(!musicLoaded && a>0){
        generateArcs();
        musicLoaded = true;
    }

    // fake beat listener
    vol=a;
    if(vol-pvol>25) generateArcs();
    pvol=vol;
}



class Arc {
    int nbEllipses, nbTraits, longueurTrait, rang, sw;
    float depart, espaceTraits;
    color c;
    Trait[] traits;
    float[] pos;
    float[] posTarget;

    Arc(int _rang) {
        nbTraits = (int) random(10,100);
        espaceTraits = (int) random(2,5);
        depart = random(360);
        longueurTrait = (int) random(1,10)*10;
        sw=(int)random(1,12);
        //c=random(1)<.2?color(255,0,0):color(255);//black Version
        c=random(1)<.2?color(255,0,0):color(0);//white Version
        rang=_rang;

        traits = new Trait[nbTraits];
        for(int i=0; i<nbTraits; i++) {
            traits[i]=new Trait(i,sw,longueurTrait,c);
        }
        pos= new float[nbTraits];
        //Arrays.fill(pos,0);
        posTarget= new float[nbTraits];
        for(int i=0; i<nbTraits; i++) {
            pos[i]=0;
            posTarget[i]=depart+i*espaceTraits;
        }
    }

    void draw() {
        for(int i=0; i<nbTraits; i++) {
            pushMatrix();
            rotate(radians(depart+i*espaceTraits));
            translate(250-rang*30,0);
            traits[i].draw();
            popMatrix();

            if((i+1)*espaceTraits>335) i=nbTraits;
        }
    }

    void anime1() {
        for(int i=0; i<nbTraits; i++) {
            pushMatrix();
            rotate(radians(depart+i*espaceTraits));
            translate(250-rang*30,0);
            traits[i].anime1();
            popMatrix();

            if((i+1)*espaceTraits>335) i=nbTraits;
        }
    }

    void anime2() {
        for(int i=0; i<nbTraits; i++) {
            pushMatrix();
            rotate(radians(depart+i*espaceTraits));
            translate(250-rang*30,0);
            traits[i].anime2();
            popMatrix();

            if((i+1)*espaceTraits>335) i=nbTraits;
        }
    }

    void anime3() {
        for(int i=0; i<nbTraits; i++) {
            pushMatrix();
            rotate(radians(depart+i*espaceTraits));
            translate(250-rang*30,0);
            traits[i].anime3();
            popMatrix();

            if((i+1)*espaceTraits>335) i=nbTraits;
        }
    }

    void anime4() {
        for(int i=0; i<nbTraits; i++) {
            pushMatrix();
            rotate(radians(pos[i]));
            translate(250-rang*30,0);
            traits[i].anime1();
            popMatrix();

            pos[i]=ease(pos[i],posTarget[i],0.05);

            if((i+1)*espaceTraits>335) i=nbTraits;
        }
    }

    void anime5() {
        for(int i=0; i<nbTraits; i++) {
            pushMatrix();
            rotate(radians(pos[i]));
            translate(250-rang*30,0);
            traits[i].anime2();
            popMatrix();

            pos[i]=ease(pos[i],posTarget[i],0.05);

            if((i+1)*espaceTraits>335) i=nbTraits;
        }
    }
}



class Trait {
    int id, swTarget, longueurTraitTarget, transpTarget;
    float sw, longueurTrait, transp;
    color c;

    Trait(int _id, int _sw, int _longueurTrait, color _c) {
        id=_id;
        swTarget=_sw;
        c=_c;
        longueurTraitTarget=_longueurTrait;
        transpTarget=255;
    }

    void draw() {
        strokeWeight(swTarget);
        stroke(c,transpTarget);
        line(0,0,longueurTraitTarget,0);
    }

    void anime1() {
        strokeWeight(sw);
        stroke(c,transpTarget);
        line(0,0,longueurTrait,0);
        longueurTrait=ease(longueurTrait,longueurTraitTarget,0.1);
        sw=ease(sw,swTarget,0.1);
    }

    void anime2() {
        strokeWeight(swTarget);
        stroke(c,transp);
        line(0,0,longueurTrait,0);
        longueurTrait=ease(longueurTrait,longueurTraitTarget,0.1);
        transp=ease(transp,transpTarget,0.1);
    }

    void anime3() {
        strokeWeight(swTarget);
        stroke(c,transpTarget);
        line(0,0,longueurTrait,0);
        longueurTrait=ease(longueurTrait,longueurTraitTarget,0.1);
    }
}
