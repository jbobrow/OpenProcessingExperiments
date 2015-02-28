
var video = document.createElement("video");
video.setAttribute("style", "display:none;");
video.setAttribute("id", "videoOutput");
video.setAttribute("width", "640px");
video.setAttribute("height", "480px");
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
int pxSize = 10;
int numRows, numCols;

void setup(){
    size(640,480);
    numCols = width/pxSize;
    numRows = height/pxSize;
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

    // get frame, downsize to needed size, look at each pixel
    img=get();
    img.resize(numCols,numRows);
    background(255);
    fill(0);
    noStroke();
    for(int j=0; j<numRows; j++){
        for(int i=0; i<numCols; i++){
            int radius = (int)map(brightness(img.get(i, j)),255,0,0,pxSize);
            
            ellipse(i*width/numCols, j*height/numRows, radius, radius);
            // determine brightness of pixel
            // int val = brightness(img.get(i, j));
            // map each value to a character in the font
            // draw character for brightness 
        }
    }    
    

}
