
HTMLElement selectedThumbnail=parent.document.body.getElementsByClassName('visThumbnail50 selected')[0].children[0];// get the selected Thumbnail HTMLElement
//HTMLElement selectedThumbnail=parent.document.body.children[0].appendChild(document.createElement('img'));//or add a new imgElement to the page
selectedThumbnail.style.width="50px";//fix the width


int slices = 70;
float pie_slice = TWO_PI/slices;

float x, y, szX, szY, theta;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  strokeCap(SQUARE);
  background(#ffffff);
}

void draw() {
  fill(#202020);
  float edge = height/10;

  createRing(0,PI);
  createRing(1,0);

  theta += 0.323;

  //if (frameCount%4==0 && frameCount<121) saveFrame("image-###.gif");
  selectedThumbnail.src=externals.canvas.toDataURL("image/jpeg",0.7);
}

void createRing(int opt, float offSet) {
  fill(#ffffff, 25);
  rect(0, 0, width, height);
  for (int i=0; i<slices; i++) { 
    y = map(sin(offSet+theta+(TWO_PI/slices)*i*5), -1, 1, -10, -180);
    szX = 600; 
    szY = height/1.8+y ;
    if (opt==1) {
      fill((360/slices)*i, 90, 90);
    } 
    else {
      fill((360/slices)*i, 90, 90, 50);
    }
    noStroke();
    pushMatrix();
    translate(width/2, height/2);   
    rotate(i*pie_slice);
    arc(0, y, szX, szY, (PI*1.5)-(pie_slice/2), (PI*1.5)+(pie_slice/2));
    popMatrix();
  }
  if (mousePressed) {
    filter(ERODE);
    }
}
