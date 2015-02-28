
PImage logo;
PImage[] capa = new PImage[14];

PFont h1;
PFont h2;
PFont h3;

color paleta[] = {
  #79ACD9, #085A8C, #0C4459, #D9A84E, #BF5239, #DFE0AF
};

int lado, margem, tolerancia;
float x, y, borda;

String[][] filme = {    
  {    
    "1995", "Toy Story"
  }  
  , {    
    "1998", "A Bug's Life"
  }  
  , {    
    "1999", "Toy Story 2"
  }  
  , {    
    "2001", "Monsters, Inc."
  }  
  , {    
    "2003", "Finding Nemo"
  }  
  , {    
    "2004", "The Incredibles"
  }  
  , {    
    "2006", "Cars"
  }  
  , {    
    "2007", "Ratatouille"
  }  
  , {    
    "2008", "Wall-E"
  }  
  , {    
    "2009", "Up"
  }  
  , {    
    "2010", "Toy Story 3"
  }  
  , {    
    "2011", "Cars 2"
  }  
  , {    
    "2012", "Brave"
  }  
  , {    
    "2013", "Monsters\nUniversity"
  }
};


void setup() {
  size(1024, 600);
  rectMode(CENTER);
  noStroke();

  for ( int i = 0; i < capa.length; i++ ) {
    capa[i] = loadImage( i + ".jpg" );
  }
  logo = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Pixar_logo.svg/500px-Pixar_logo.svg.png");
  imageMode(CENTER);

  h1 = loadFont("CourierNewPSMT-16.vlw");
  h2 = loadFont("CourierNewPSMT-14.vlw");
  textAlign(CENTER, CENTER);

  lado = 20;
  margem = 50;
  tolerancia = 20;
  borda = 2;
  x = margem + lado;
  y = height - 75;
}
void draw() {
  if (mousePressed && mouseButton == LEFT) {
    if ((mouseY > y - lado / 2 - tolerancia) && (mouseY < y + lado / 2 + tolerancia)) {
      float distancia = dist(mouseX, 0, x, 0);
      float vel = map(distancia, 10, width - 10, 0.5, 150);

      if (mouseX > x) {
        if (pmouseX < width - margem/2 - lado/2) x += vel;
      }
      else if (mouseX < x) {
        if (pmouseX > margem/2 + lado/2) x -= vel;
      }

      x = constrain(x, (margem/2 + lado + borda), (width - margem/2 - lado - borda));
    }
  }

  background(paleta[2]);

  barra();

  image(logo, 4*width/6, 240);
}

void barra() {
  fill(paleta[3]);
  rect(width / 2, y, width - margem, lado, 4, 4, 4, 4);

  fill(paleta[4]);
  rect(x, y, 2*lado, lado - borda, 2, 2, 2, 2);

  for (int i = 0; i < filme.length; i++) {
    float pt = map(int(filme[i][0]), 1995, 2013, margem + lado, width - margem - lado);

    if (dist(x, y, pt, y) <= lado) {
      fill(paleta[5]);
      ellipse(pt, y, 12, 12);
      textFont(h1);
      text(filme[i][1], pt, y - 40);

      fill(paleta[3]);
      rect(width/4, 240, capa[i].width + 10, capa[i].height + 10, 4, 4, 4, 4);
      image(capa[i], width/4, 240);
    }
    else {
      fill(paleta[2]);
      ellipse(pt, y, 13, 13);
    }

    fill(paleta[5]);
    ellipse(pt, y, 10, 10);

    textFont(h2);
    fill(paleta[5]);
    text(filme[i][0], pt, y + 25);
  }
}



