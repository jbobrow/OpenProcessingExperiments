
class Block {
    float s;
    float x,y,z;
    Block(float s_) {
      s = s_;
    }
    boolean intersects(Block b) {
      return false;
    }
    boolean intersects(Player p) {
      return false;
    }
    void display(PImage t1, PImage t2, PImage t3, PImage t4, PImage t5, PImage t6) { // Using a different texture per face in anticipation of non-uniform blocks 
        noStroke();
        pushMatrix();
          translate( 0, 0, -s/2);
          beginShape(QUADS);
            texture(t1);
            vertex(-s/2,-s/2, 0, 0);
            vertex(-s/2, s/2, 0, 256);
            vertex( s/2, s/2, 256, 256);
            vertex( s/2,-s/2, 256, 0);
          endShape(CLOSE);
          translate( 0, 0, s);
          beginShape(QUADS);
            texture(t2);
            vertex(-s/2,-s/2, 0, 0);
            vertex(-s/2, s/2, 0, 256);
            vertex( s/2, s/2, 256, 256);
            vertex( s/2,-s/2, 256, 0);
          endShape(CLOSE);
          translate( 0, 0, -s/2);
          rotateX(PI/2);
          translate( 0, 0, -s/2);
          beginShape(QUADS);
            texture(t3);
            vertex(-s/2,-s/2, 0, 0);
            vertex(-s/2, s/2, 0, 256);
            vertex( s/2, s/2, 256, 256);
            vertex( s/2,-s/2, 256, 0);
          endShape(CLOSE);
          translate( 0, 0, s);
          fill( 255, 255, 255 );
          beginShape(QUADS);
            texture(t4);
            vertex(-s/2,-s/2, 0, 0);
            vertex(-s/2, s/2, 0, 256);
            vertex( s/2, s/2, 256, 256);
            vertex( s/2,-s/2, 256, 0);
          endShape(CLOSE);                
          translate( 0, 0, -s/2);                
          rotateX(-PI/2);
          rotateY(PI/2);
          translate( 0, 0, -s/2);
          beginShape(QUADS);
            texture(t5);
            vertex(-s/2,-s/2, 0, 0);
            vertex(-s/2, s/2, 0, 256);
            vertex( s/2, s/2, 256, 256);
            vertex( s/2,-s/2, 256, 0);
          endShape(CLOSE);
          translate( 0, 0, s);
          beginShape(QUADS);
            texture(t6);
            vertex(-s/2,-s/2, 0, 0);
            vertex(-s/2, s/2, 0, 256 );
            vertex( s/2, s/2, 256, 256 );
            vertex( s/2,-s/2, 256, 0);
         endShape(CLOSE);
         popMatrix();
    }
}

