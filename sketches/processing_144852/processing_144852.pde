
size(400,400,P3D);
//ortho();

camera(200,200,50,50,50,40,0,0,-1);




beginShape();              //floor
  vertex(0,0,0);
  vertex(100,0,0);
  vertex(100,100,0);
  vertex(0,100,0);
endShape(CLOSE);

fill(4,95,3);      //grass
noStroke();
beginShape();
vertex(-500,-500,-1);
vertex(-500,500,-1);
vertex(500,500,-1);
vertex(500,-500,-1);
endShape(CLOSE);


fill(240,25,245);
beginShape();            // y axis wall
vertex(0,0,0);
vertex(0,100,0);
vertex(0,100,80);
vertex(0,0,80);
endShape(CLOSE);

beginShape();           // x axis wall
vertex(0,0,0);
vertex(100,0,0);
vertex(100,0,80);
vertex(0,0,80);
endShape(CLOSE);

beginShape();           // x 100 wall
vertex(100,100,0);
vertex(100,100,80);
vertex(100,0,80);
vertex(100,0,0);
endShape(CLOSE);

beginShape();        // y 100 wall
vertex(0,100,0);
vertex(100,100,0);
vertex(100,100,80);
vertex(0,100,80);
endShape(CLOSE);

//roof

fill(137,123,123);
beginShape();
vertex(100,0,80);
vertex(0,0,80);
vertex(50,50,125);
endShape(CLOSE);


beginShape();
vertex(100,0,80);
vertex(0,100,80);
vertex(50,50,125);
endShape(CLOSE);

beginShape();
vertex(50,50,125);
vertex(0,100,80);
vertex(0,0,80);
endShape(CLOSE);

beginShape();
vertex(100,100,80);
vertex(50,50,125);
vertex(100,0,80);
endShape(CLOSE);

beginShape();
vertex(0,100,80);
vertex(100,100,80);
vertex(50,50,125);
endShape(CLOSE);


fill(25,245,217);
//doors
beginShape(); //left door 
  vertex(30,101,0);
  vertex(50,101,0);
  vertex(50,101,45);
  vertex(30,101,45);
  vertex(30,101,0);
endShape(CLOSE);

beginShape(); // right door 
  vertex(50,101,0);
  vertex(50,101,45);
  vertex(70,101,45);
  vertex(70,101,0);
  vertex(50,101,0);
endShape(CLOSE);

stroke(0,0,0);
strokeWeight(5);
point(46,101,20);
point(54,101,20);

 // door knobs

