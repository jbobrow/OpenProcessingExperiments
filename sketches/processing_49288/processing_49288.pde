
int pts = 1; 
float angle = 0;
float radius = 10.0;

// lathe segments
int segments = 100;
float latheAngle = 0;
float latheRadius = 90.0;

//vertices
PVector vertices[], vertices2[];

// for shaded or wireframe rendering 
boolean isWireFrame = false;

// for optional helix
boolean isHelix = false;
float helixOffset = 5.0;

void setup(){
  size(screen.width, screen.height, OPENGL);
  hint(DISABLE_DEPTH_TEST);
  smooth();
}

void draw(){
  fill(220,10);
  rect(0,0, width, height);
  noFill();
  
  if(frameCount % 60 < 5){
  noStroke();
  fill(200,0,20);
  ellipse(width*.8, height*.4, 7,7);
  noFill();
  }
  
  stroke(255);
  strokeWeight(2);
  //line (0, height/2, width, height/2);
  // basic lighting setup
  //lights();
  // 2 rendering styles
  // wireframe or solid

    stroke(255);
    strokeWeight(0.5);
    noFill();
  //center and spin toroid
  translate(width/2, height/2, -100);

  //rotateY(frameCount*PI/150);
  if (frameCount % 50 > 0 && frameCount % 50 < 6){
  rotateY(radians(random(360)));
  stroke(255);
  }
  else{noStroke();}
  //rotateZ(frameCount*PI/90);

  // initialize point arrays
  vertices = new PVector[pts+1];
  vertices2 = new PVector[pts+1];

  // fill arrays
  for(int i=0; i<=pts; i++){
    vertices[i] = new PVector();
    vertices2[i] = new PVector();
    vertices[i].x = latheRadius + sin(radians(angle))*radius;
    //if (isHelix){
      vertices[i].z = cos(radians(angle))*radius-(helixOffset* 
        segments)/2;
    //} 
    //else{
      //vertices[i].z = cos(radians(angle))*radius;
    //}
    angle+=100.0/pts;
  }

  // draw toroid
  latheAngle = 0;
  for(int i=0; i<=segments; i++){
    beginShape(TRIANGLE_STRIP);
    for(int j=0; j<=pts; j++){
      if (i>0){
        vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
      }
      vertices2[j].x = cos(radians(latheAngle))*vertices[j].x;
      vertices2[j].y = sin(radians(latheAngle))*vertices[j].x;
      vertices2[j].z = vertices[j].z;
      // optional helix offset
      if (isHelix){
        vertices[j].z+=helixOffset;
      } 
      vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z + 100);
    }
    // create extra rotation for helix
    if (isHelix){
      latheAngle+=720.0/segments;
    } 
    else {
      latheAngle+=360.0/segments;
    }
    endShape();
  }
  segments = int(random(100));
}
                
                                                                
