
PImage foto;
PImage foto2;
PImage foto3;
PImage foto4;

boolean bars = true;

var audioElement = document.createElement("audio");

 
 
void setup(){
  size(865,558); 
  foto = loadImage ("weekendbmx.jpg");
  foto2 = loadImage ("stevebars.jpg");
  foto3 = loadImage ("garrettbars.jpg");
  foto4 = loadImage ("chadbars.jpg");
}

void draw (){
if (bars) {
  image (foto, 0,0, width, height);
  }else{
  image (foto3,width/2+5,0, 865, 558);
  
  
    image (foto2,0,0, width/2+2, height/2);
    image (foto4,0,height/2+3, width/2, height/2);
  }
  }

  



void mousePressed () {
  bars = !bars;
 
  audioElement.setAttribute("src","poik.mp3");
  audioElement.play();
}
  








