
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
        alert("CouldnÃ�Â¢Ã¯Â¿Â½Ã¯Â¿Â½t access webcam.");
    }
);
 
var ctx;
PImage img;
PImage masque,videotemp;
int nb=20;
int numPixels;
 
void setup(){
    size(640,480);
    ctx = externals.context;
    ellipseMode(CORNER);
    smooth();
    videotemp=new PImage(width, height);
    numPixels=width*height;
}
 
void draw(){/*
    video.loadPixels();
   videotemp.loadPixels();
   
  
   
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness

    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(video.pixels[i]);
      if (pixelBrightness > tolerance) { // If the pixel is brighter than the
    //    videotemp.pixels[i] = video.pixels[i]; // tolerance value, make it white
      } 
      else { // Otherwise,
    //    videotemp.pixels[i] = black; // make it black
      }
    }
    updatePixels();
      
    ctx.drawImage(video, 0, 0, width, height); 
}
