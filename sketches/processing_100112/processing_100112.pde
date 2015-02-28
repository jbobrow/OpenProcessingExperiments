
BvhParser parserA = new BvhParser();
PBvh bvh1, bvh2, bvh3;

public void setup(){
  size( 640, 360, P3D );
  background( 0 );
  noStroke();
  frameRate( 15 ); //fpsが大きすぎるとチカチカする

  bvh1 = new PBvh( loadStrings( "aa.bvh" ) );
  bvh2 = new PBvh( loadStrings( "kashi.bvh" ) );
  bvh3 = new PBvh( loadStrings( "no.bvh" ) );

  loop();
}

public void draw(){
  background( 0 );

  //camera
  float _cos = cos(millis() / 3000.f);
  float _sin = sin(millis() / 3000.f);
  //camera(width/4.f + width/4.f * _cos +200, height/2.0f-100, 550 + 150 * _sin, width/2.0f, height/2.0f, -400, 0, 1, 0);
  camera((float) mouseX*1.5+(width/2)*(1-1.5), (float) mouseY-300, 100.f*3, (float) (width/2.f), (float) (height*2/5.f), 0.f, 0.f, 1.f, 0.f);
  //mouseXの回転は「y=mouseX*A+(width/2)*(1-A)　※Aは定数」の式にする。「y=mouseX*A+B,mouseX=width/2のときy=width/2」より。

  //ground 
  fill( color( 255 ));
  stroke(127);
  line(width/2.0f, height/2.0f, -30, width/2.0f, height/2.0f, 30);
  stroke(127);
  line(width/2.0f-30, height/2.0f, 0, width/2.0f + 30, height/2.0f, 0);
  stroke(255);
  pushMatrix();
  translate( width/2, height/2-10, 0);
  scale(-1, -1, -1);

  //model
  bvh1.update( millis() );
  bvh2.update( millis() );
  bvh3.update( millis() );
  bvh1.draw();
  bvh2.draw();
  bvh3.draw();
  popMatrix();  
}

public class PBvh{ 
  public BvhParser parser;  

  public PBvh(String[] data){
    parser = new BvhParser();
    parser.init();
    parser.parse( data );
  }

  public void update( int ms ){
    parser.moveMsTo( ms );//30-sec loop 
    parser.update();
  }

  public void draw(){
    //fill(color(255));
    float R = random(50, 255);
    float G = random(50, 255);
    float B = random(50, 255);
    float H = random(50, 255);
    fill(R, G, B, H);
    noStroke();
    //strokeWeight(1);
    float size = random(0.7, 1.2);

    for ( BvhBone b : parser.getBones()){
      pushMatrix();
      translate(b.absPos.x, b.absPos.y, b.absPos.z);
      rotate(random(PI));
      box(6);
      popMatrix();
      if (!b.hasChildren()){
        pushMatrix();
        translate( b.absEndPos.x, b.absEndPos.y, b.absEndPos.z);
        rotate(random(PI));
        box(30);
        popMatrix();
      }
    }
  }
}




