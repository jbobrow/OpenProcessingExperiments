
size(400,400);
background(255);
float wd, ht, x, y, modx, mody;
wd=400;
ht=400;
x=100;
y=100;


modx= x-85;
mody= y-90;

//Sunglasses
fill(0,0,0);
quad(23*wd/56+modx,ht/4+1.5*ht/10+mody,
     23*wd/56-0.5*wd/10+modx,ht/4+3*ht/10+mody,
     23*wd/56-1.5*wd/10+modx,ht/4+3*ht/10+mody,
     23*wd/56-1.65*wd/10+modx,ht/4+1.7*ht/10+mody);
quad(23*wd/56+0.5*wd/10+modx,ht/4+1.7*ht/10+mody,
     23*wd/56+2*wd/10+modx,ht/4+1.9*ht/10+mody,
     23*wd/56+1.45*wd/10+modx,ht/4+2.9*ht/10+mody,
     23*wd/56+0.6*wd/10+modx,ht/4+3*ht/10+mody);

//stash
noStroke();
fill(100,100,100);
beginShape();
  curveVertex(23*wd/56-1.2*wd/10+modx,ht/4+8*ht/10+mody);
  curveVertex(23*wd/56-1*wd/10+modx,ht/4+5*ht/10+mody);
  curveVertex(23*wd/56+0.4*wd/10+modx,ht/4+4.2*ht/10+mody);
  curveVertex(23*wd/56+1.7*wd/10+modx,ht/4+5*ht/10+mody);
  curveVertex(23*wd/56+1.9*wd/10+modx,ht/4+7*ht/10+mody);
endShape();
fill(255);
beginShape();
  curveVertex(23*wd/56-1.2*wd/10+modx,ht/4+5.4*ht/10+mody);
  curveVertex(23*wd/56-1*wd/10+modx,ht/4+5*ht/10+mody);
  curveVertex(23*wd/56+0.4*wd/10+modx,ht/4+4.8*ht/10+mody);
  curveVertex(23*wd/56+1.7*wd/10+modx,ht/4+5*ht/10+mody);
  curveVertex(23*wd/56+1.9*wd/10+modx,ht/4+5.4*ht/10+mody);
endShape();


noFill();
strokeWeight( 13*(wd+ht)/800 );
  stroke( 200, 0, 0 );  // red

//JR
line(wd/4+modx,ht/4+mody,4*wd/7+modx,ht/4+mody);
line(23*wd/56+modx,ht/4+mody,23*wd/56+modx,ht/4+1.5*ht/10+mody);
beginShape( );
  curveVertex(23*wd/56+modx,ht/4+mody);
  curveVertex(23*wd/56+modx,ht/4+1.5*ht/10+mody);
  curveVertex(23*wd/56-0.5*wd/10+modx,ht/4+3*ht/10+mody);
  curveVertex(23*wd/56-1.5*wd/10+modx,ht/4+3*ht/10+mody);
  curveVertex(23*wd/56-1.5*wd/10+modx,ht/4+1.7*ht/10+mody);
  curveVertex(23*wd/56+1.5*wd/10+modx,ht/4+1.7*ht/10+mody);
  curveVertex(23*wd/56+2*wd/10+modx,ht/4+2.2*ht/10+mody);
  curveVertex(23*wd/56+1.4*wd/10+modx,ht/4+2.9*ht/10+mody);
  curveVertex(23*wd/56+0.6*wd/10+modx,ht/4+3*ht/10+mody);
  curveVertex(23*wd/56-wd/10+modx,ht/4+3*ht/10+mody);
  endShape( );

//-->R
beginShape( );
  curveVertex(23*wd/56+0.4*wd/10+modx,ht/4+0.7*ht/10+mody);
  curveVertex(23*wd/56+0.5*wd/10+modx,ht/4+1.6*ht/10+mody);
  curveVertex(23*wd/56+0.6*wd/10+modx,ht/4+3*ht/10+mody);
  curveVertex(23*wd/56+0.7*wd/10+modx,ht/4+4.7*ht/10+mody);
  curveVertex(23*wd/56+0.8*wd/10+modx,ht/4+5.2*ht/10+mody);
endShape( );

//R<--
beginShape( );
  curveVertex(23*wd/56-0.5*wd/10+modx,ht/4+2.7*ht/10+mody);
  curveVertex(23*wd/56+0.6*wd/10+modx,ht/4+3*ht/10+mody);
  curveVertex(23*wd/56+1.8*wd/10+modx,ht/4+3.5*ht/10+mody);
  curveVertex(23*wd/56+2.5*wd/10+modx,ht/4+4.7*ht/10+mody);
  curveVertex(23*wd/56+2.5*wd/10+modx,ht/4+5.2*ht/10+mody);
endShape( );

strokeWeight( 6*(wd+ht)/800 );
stroke( 200, 0, 0 );  // red
beginShape( );
  curveVertex(23*wd/56-0.3*wd/10+modx,ht/4+2.2*ht/10+mody);
  curveVertex(23*wd/56-0.1*wd/10+modx,ht/4+2.1*ht/10+mody);
  curveVertex(23*wd/56+0.24*wd/10+modx,ht/4+1.95*ht/10+mody);
  curveVertex(23*wd/56+0.6*wd/10+modx,ht/4+2.1*ht/10+mody);
  curveVertex(23*wd/56+0.8*wd/10+modx,ht/4+2.2*ht/10+mody);
endShape( );


