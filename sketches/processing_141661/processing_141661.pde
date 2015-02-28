
class Building {

  float[] pos;
  float[] size;
  PImage tex_wall1;
  PImage tex_wall2;
  PImage tex_wall3;
  PImage tex_wall4;
  PImage tex_roof;
  
  public Building( Map map, int p ) {
  
    pos = new float[] { 
      ( map.grid[ p ][ CCOL ] * map.cell[0] ) + map.cell[0] * 0.5f,
      ( map.grid[ p ][ CROW ] * map.cell[1] ) + map.cell[1] * 0.5f
    };
    size = new float[] { 
      map.cell[0] * random( 0.85f, 0.98f ), 
      map.cell[1] * random( 0.85f, 0.98f ),
      map.cell[0] * 0.6f + random( 0, map.cell[0] * 1.5) };
    
    if ( size[ 2 ] < map.cell[0] * 0.95f ) {
      tex_wall1 = texture_hangar;
      tex_wall2 = texture_hangar;
      tex_wall3 = texture_hangar;
      tex_wall4 = texture_hangar_door;
      tex_roof = texture_hangar_roof;
    } else {
      tex_wall1 = texture_building;
      tex_wall2 = texture_building;
      tex_wall3 = texture_building;
      tex_wall4 = texture_building;
      tex_roof = texture_roof;
    }
    
  }
  
  public void draw( float draww, float drawh ) {
    
    pushMatrix();
    translate( pos[ 0 ] * draww, pos[ 1 ] * drawh, 0 );
    
    float w = size[ 0 ] * draww;
    float h = size[ 1 ] * drawh;
    float d = size[ 2 ] * draww;
    
    noStroke();
    fill( 160,160,160 );
    
    beginShape();
      texture( tex_roof );
      vertex( -w*0.5f, -h*0.5f, d, 0,0 );
      vertex( w*0.5f, -h*0.5f, d, tex_roof.width,0 );
      vertex( w*0.5f, h*0.5f, d, tex_roof.width, tex_roof.height );
      vertex( -w*0.5f, h*0.5f, d, 0,tex_roof.height );
    endShape();
    
    beginShape();
      // side 1
      texture( tex_wall1 );
      vertex( -w*0.5f, -h*0.5f, d, 0,0 );
      vertex( -w*0.5f, h*0.5f, d, tex_wall1.width,0 );
      vertex( -w*0.5f, h*0.5f, 0, tex_wall1.width, tex_wall1.height );
      vertex( -w*0.5f, -h*0.5f, 0, tex_wall1.height );
    endShape();
    
    beginShape();
      // side 2
      texture( tex_wall2 );
      vertex( -w*0.5f, -h*0.5f, d, 0,0 );
      vertex( w*0.5f, -h*0.5f, d, tex_wall2.width,0 );
      vertex( w*0.5f, -h*0.5f, 0, tex_wall2.width, tex_wall2.height );
      vertex( -w*0.5f, -h*0.5f, 0, 0, tex_wall2.height );
    endShape();
    
    beginShape();
      // side 3
      texture( tex_wall3 );
      vertex( w*0.5f, -h*0.5f, d, 0,0 );
      vertex( w*0.5f, h*0.5f, d, tex_wall3.width,0 );
      vertex( w*0.5f, h*0.5f, 0, tex_wall3.width, tex_wall3.height );
      vertex( w*0.5f, -h*0.5f, 0, 0, tex_wall3.height );
    endShape();
    
    beginShape();
      // side 4
      texture( tex_wall4 );
      vertex( w*0.5f, h*0.5f, d, 0,0 );
      vertex( -w*0.5f, h*0.5f, d, tex_wall4.width,0 );
      vertex( -w*0.5f, h*0.5f, 0, tex_wall4.width, tex_wall4.height );
      vertex( w*0.5f, h*0.5f, 0, 0, tex_wall4.height );
    endShape();
    
    popMatrix();
    
  }

}

