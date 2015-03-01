
var video = document.createElement("video");
video.setAttribute("style", "display:none;");
video.setAttribute("id", "videoOutput");
video.setAttribute("width", "500px");
video.setAttribute("height", "660px");
video.setAttribute("autoplay", "true");
if(document.body!=null) document.body.appendChild(video);
 
function init() {
    if (navigator.webkitGetUserMedia) {
        navigator.webkitGetUserMedia({video:true}, gotStream, noStream);
 
        function gotStream(stream) {
            video.src = webkitURL.createObjectURL(stream);
            video.onerror = function () {
                stream.stop();
                streamError();
            };
        }
 
        function noStream() {
            alert('No camera available.');
        }
 
        function streamError() {
            alert('Camera error.');
        }
    }
}
 
var ctx;
PImage img;
int nb=20;
 
void setup(){
    size(500,660);
    ctx = externals.context;
    ellipseMode(CORNER);
    smooth();
    init();
}
 
void draw(){
    pushMatrix();
    translate(width,0);
    scale(-1,1);//mirror the video
    ctx.drawImage(video, 0, 0, width, height); //video is defined outside processing code
    popMatrix();
 
    //do something
    img=get();
    noStroke();
    fill(img.get());
    rect(width, height);
}
