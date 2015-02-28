
var video = document.createElement("video");
video.setAttribute("style", "display:none;");
video.setAttribute("id", "videoOutput");
video.setAttribute("width", "500px");
video.setAttribute("height", "660px");
video.setAttribute("autoplay", "true");
if(document.body!=null) document.body.appendChild(video);
 
// var video = document.getElementById("videoOutput");
 
var getUserMedia = function(t, onsuccess, onerror) {
    if (navigator.getUserMedia) {
        return navigator.getUserMedia(t, onsuccess, onerror);
    } else if (navigator.webkitGetUserMedia) {
        return navigator.webkitGetUserMedia(t, onsuccess, onerror);
    } else if (navigator.mozGetUserMedia) {
        return navigator.mozGetUserMedia(t, onsuccess, onerror);
    } else if (navigator.msGetUserMedia) {
        return navigator.msGetUserMedia(t, onsuccess, onerror);
    } else {
        onerror(new Error("No getUserMedia implementation found."));
    }
};
 
var URL = window.URL || window.webkitURL;
var createObjectURL = URL.createObjectURL || webkitURL.createObjectURL;
if (!createObjectURL) {
    throw new Error("URL.createObjectURL not found.");
}
 
getUserMedia({audio:true, video:true},
    function(stream) {
        var url = createObjectURL(stream);
        video.src = url;
    },
    function(error) {
        alert("Couldnâ��t access webcam.");
    }
);
 
var ctx;
PImage img;
int nb=20;
 
void setup(){
    size(640,480);
    ctx = externals.context;
    ellipseMode(CORNER);
    smooth();
}
 
void draw(){/*
    pushMatrix();
    translate(width,0);
    scale(-1,1);//mirror the video
    ctx.drawImage(video, 0, 0, width, height); //video is defined outside processing code
    popMatrix();
 
    //do something
    img=get();
    img.resize(nb,nb);
    background(255);
    noStroke();
    for(int j=0; j<nb; j++){
        for(int i=0; i<nb; i++){
            fill(img.get(i, j));
            ellipse(i*width/nb, j*height/nb, width/nb, height/nb);
        }
    }
    */
    ctx.drawImage(video, 0, 0, width, height); 
}
