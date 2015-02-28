

// Luca Sassone
// luglio 2010

int ninv = 50;
cInvitato [] invitato = new cInvitato[ninv];
float [][] mat = new float[ninv][ninv];

PGraphics pg;
int[][] vy,vx; 

color [] palette = new color[256];

// ------------------------------------------------------------------------------------------------------------
/*
static public void main(String args[]) {
  PApplet.main(new String[] { 
    "--present", "PartyPlanner"   }
  );
}
*/
// ------------------------------------------------------------------------------------------------------------

void setup () {
  size(640, 480, P2D);

  pg = createGraphics(120, 90, P2D);    
  
  for (int i=0; i<ninv; i++) {
    invitato[i] = new cInvitato();
    for (int j=0; j<ninv; j++) {
      mat[i][j] = random(30, 80);
    }
  }
  noCursor();
  
  for (int i=0; i<256; i++) {
    int so1 = 140;
    int so2 = 150;
    int so3 = 200;
    if (i < so1)      palette[i] = color(    100*i/so1,             255*i/so1, 100*i/so1);
    else if (i < so2) palette[i] = color(100+100*(i-so1)/(so2-so1), 255, 100+100*(i-so1)/(so2-so1));
    else if (i < so3) palette[i] = color(200- 50*(i-so2)/(so3-so2), 255, 200);
    else              palette[i] = color(150-150*(i-so3)/(255-so3), 255, 200);
  }  
}

// ------------------------------------------------------------------------------------------------------------

void draw () {  
  for (int i=0; i<ninv; i++) {
    invitato[i].delta = new PVector();
    for (int j=0; j<ninv; j++) {
      if (i != j) {
        invitato[i].step(invitato[j], mat[i][j]);
      }
    }
  }

  for (int i=0; i<ninv; i++) {
    invitato[i].step2();
  }
  
  pg.beginDraw();
  pg.loadPixels();
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int m = 0;
      for (int i = 0; i < ninv; i++) {
        // Increase this number to make your blobs bigger
        m += 3000 / (invitato[i].vy[y] + invitato[i].vx[x] + 30);
      }      
      pg.pixels[x + y * pg.width] = palette[constrain(m, 0, 255)];
    }
  }
  pg.updatePixels();
  pg.endDraw();

  image(pg, 0, 0, width, height); 
}

// ------------------------------------------------------------------------------------------------------------

class cInvitato {
  PVector pos = new PVector();
  PVector delta = new PVector();
  int [] vy, vx; 

  cInvitato() {
    pos.x = random(0, pg.width);
    pos.y = random(0, pg.height);
    vx = new int[pg.width];  
    vy = new int[pg.height];
  }

  void step (cInvitato n, float m) {

    float deltax = n.pos.x - pos.x;
    float deltay = n.pos.y - pos.y;
    float dista = sqrt(deltax*deltax + deltay*deltay);
    float dedist = dista - m;
    float den = 1.0 + dista * dista;
    float k = dedist / den / 2.0;
    float dex = deltax * k;
    float dey = deltay * k;
    delta.x += dex;
    delta.y += dey;
/*
delta.x += 1 * (noise(0.01*pos.x, 0.01*pos.y) - 0.5);
delta.y += 1 * (noise(0.01*pos.y, 0.01*pos.x) - 0.5);
*/
  }

  void step2 () {
    pos.add(delta);
    
    pos.x = constrain(pos.x, 0, pg.width);
    pos.y = constrain(pos.y, 0, pg.height);

/*
    pos.x = (pos.x + pg.width) % pg.width;
    pos.y = (pos.y + pg.height) % pg.height;
*/    
    for (int x = 0; x < pg.width; x++) {
      vx[x] = int(sq(pos.x - x));
    }

    for (int y = 0; y < pg.height; y++) {
      vy[y] = int(sq(pos.y - y)); 
    }
  }  
}


