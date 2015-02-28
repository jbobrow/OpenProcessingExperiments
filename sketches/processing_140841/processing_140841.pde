
// check if the default naming is enabled, if not use the chrome one.
if (! window.AudioContext) {
    if (! window.webkitAudioContext) {
        alert('no audiocontext found');
    }
    window.AudioContext = window.webkitAudioContext;
}

var audioContext, analyserNode, javascriptNode;
var frequencies = new Array();
var tracks = new Array();
var img = new Image();
var ctx;

int bufferSize = 512;
String musicUrl, artistName, musicName, info;
int Y = -100;
float sensib =1.5;
float echelle;
int step = 2;

void setup(){
    size(800, 1000, P2D);
    ctx = externals.context;

    background(0);
smooth();
    ctx.fillStyle = "rgba(0,0,0,.8)";
    ctx.strokeStyle = "rgba(255,255,255,0.1)";

    echelle = width/bufferSize;

    setupAudio(bufferSize);
    loadTracks("http://freemusicarchive.org/api/get/tracks.jsonp");

    cursor(HAND);
}

void draw(){
    if(frameCount%3==0){
        if(frameCount>6) ctx.drawImage(img, 0, -2);

        ctx.beginPath();
        ctx.moveTo(0,Y+frequencies[0]*sensib);
        for(var i=step;i<bufferSize;i+=step){
            ctx.lineTo(i*echelle,Y+frequencies[i]*sensib);
        }
        ctx.lineTo(width,Y+400);
        ctx.lineTo(0,Y+400);
        ctx.closePath();
        ctx.fill();

        for(var i=1; i<bufferSize-step; i+=step){
            ctx.beginPath();
            ctx.moveTo(i*echelle, Y+frequencies[i]*sensib);
            ctx.lineTo(i+step, Y+frequencies[i+step]*sensib);
            ctx.stroke();
        }
        
        img.src = document.getElementById("pjsComplexSketch").toDataURL("image/jpeg");

        fill(0,100);
        rect(5,height-30,textWidth(info)+10,20);
        fill(150);
        text(info, 10, height-15);
        if (Y<height-300) {
            Y+=2;
        }
    }
}

void mousePressed(){
    link(musicUrl, "_blank");
}

void setupAudio(buffSize) {
    audioContext = new AudioContext();

    //javascriptNode = audioContext.createJavaScriptNode(buffSize, 1, 1);
    javascriptNode = audioContext.createScriptProcessor(2048, 1, 1);
    javascriptNode.connect(audioContext.destination);

    javascriptNode.onaudioprocess = function() {
        var array = new Uint8Array(analyserNode.frequencyBinCount);
        analyserNode.getByteTimeDomainData(array);
        frequencies = array;
    }

    analyserNode = audioContext.createAnalyser();
    analyserNode.smoothingTimeConstant = 0.3;
    analyserNode.fftSize = buffSize * 2;
}

void loadTracks(String url){
    $.ajax({
        type: 'GET',
        url: url,
        async: true,
        dataType: 'jsonp',
        data: {
            api_key: "ZKJN9EFX80U6740Y",
            limit: 50
        },
        success: function(json) {
            tracks = json.dataset;
            //console.dir(tracks);

            int nb=int(random(tracks.length));
            musicName = tracks[nb].track_title;
            artistName = tracks[nb].artist_name;
            info = musicName + " - " + artistName;
            musicUrl = tracks[nb].track_url;
            //console.log(musicUrl);

            var a = document.createElement('audio');
            a.autoplay = true;
            a.src = musicUrl+"/download";
            a.controls = true;
            
            document.body.appendChild(a);
            
            var source = audioContext.createMediaElementSource(a);
            source.connect(analyserNode);
            analyserNode.connect(javascriptNode);
            source.connect(audioContext.destination);
        },
        error: function(e) {
           console.log(e.message);
        }
    });
}
