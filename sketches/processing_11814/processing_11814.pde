
class Volume{

  float[] pX = {
    random(-80, 0), random(0, 80), random(0, 80), random(-80, 0)                                                                                      };
  float[] pY = {
    random(-80, 0), random(-80, 0), random(0, 80), random(0, 80)                                                                                      };
  float[] pZ = {
    random(0, 80), random(-80, 0), random(0, 80), random(-80, 0)                                                                                      };

  float x, y, z;
  float rX = random(360), rY = random(360), rZ = random(360);
  float s = random(0.05, 1);

  Particle P;
  Attraction A;
  float attraction, repulsion;
  color c;
  
  Volume(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
    P = physics.makeParticle( 1.0, x, y, z );
    attraction = ((width/0.1)/(s*0.03))*5;
    A = physics.makeAttraction(Mouse, P, attraction, minDistAttract);
   c = colors[(int)random(colors.length)];
  }

  void update(){
    float distance = dist(Mouse.position().x(),  Mouse.position().y(), Mouse.position().z(), P.position().x(),  P.position().y(), P.position().z());
    if(distance>forceShield){
      x = P.position().x();
      y = P.position().y();
     //if (beat.isKick()) z = P.position().z();
    }



    pushMatrix();
    translate(x, y, z);
    noStroke();
    fill(c, 100);
    ellipse(0, 0, s*5, s*5);
    
    specular(60, 60, 60);
    ambient(60, 60, 60);
    tint(c, 100);
    image(tex, 0, 0, tex.width*s, tex.height*s);

    popMatrix();

  }

}








