
PImage open;
PImage top;
PImage bottom;

PImage openBar;
PImage danceInjury;
PImage pictures;
PImage glass;
PImage blackHat;

PImage psalms;
PImage belly;
PImage candy;
PImage mixed;
PImage sushi;

PImage tree;
PImage tux;
PImage yes;
PImage speech;
PImage dress;

PImage cell;
PImage dance;
PImage iyh;
PImage flower;
PImage aisle;

PImage fire;
PImage third;
PImage groom;
PImage kids;
PImage chassid;

PImage openBar2;
PImage danceInjury2;
PImage pictures2;
PImage glass2;
PImage blackHat2;

PImage psalms2;
PImage belly2;
PImage candy2;
PImage mixed2;
PImage sushi2;

PImage tree2;
PImage tux2;
PImage yes2;
PImage speech2;
PImage dress2;

PImage cell2;
PImage dance2;
PImage iyh2;
PImage flower2;
PImage aisle2;

PImage fire2;
PImage third2;
PImage groom2;
PImage kids2;
PImage chassid2;

float count=0;

void setup(){
  size(511,691);
  noStroke();
  
  open = loadImage("weddingbingo-30.jpg");
  top = loadImage ("weddingbingo-28.jpg");
  bottom = loadImage ("weddingbingo-27.jpg");
  
  open.resize(width,height);
  top.resize(width, 184);
  bottom.resize(width,44);
  
  openBar = loadImage ("weddingbingo-02.jpg");
  danceInjury = loadImage ("weddingbingo-03.jpg");
  pictures = loadImage ("weddingbingo-04.jpg");
  glass = loadImage ("weddingbingo-05.jpg");
  blackHat = loadImage ("weddingbingo-06.jpg");
  
  psalms = loadImage ("weddingbingo-07.jpg");
  belly = loadImage ("weddingbingo-08.jpg");
  candy = loadImage ("weddingbingo-09.jpg");
  mixed = loadImage ("weddingbingo-10.jpg");
  sushi = loadImage ("weddingbingo-11.jpg");
  
  tree = loadImage ("weddingbingo-12.jpg");
  tux = loadImage ("weddingbingo-13.jpg");
  yes = loadImage ("weddingbingo-14.jpg");
  speech = loadImage ("weddingbingo-15.jpg");
  dress = loadImage ("weddingbingo-16.jpg");
  
  cell = loadImage ("weddingbingo-17.jpg");
  dance = loadImage ("weddingbingo-18.jpg");
  iyh = loadImage ("weddingbingo-19.jpg");
  flower = loadImage ("weddingbingo-20.jpg");
  aisle = loadImage ("weddingbingo-21.jpg");
 
  fire = loadImage ("weddingbingo-22.jpg");
  third = loadImage ("weddingbingo-23.jpg");
  groom = loadImage ("weddingbingo-24.jpg");
  kids = loadImage ("weddingbingo-25.jpg");
  chassid = loadImage ("weddingbingo-26.jpg");
  
  openBar.resize(90,90);
  danceInjury.resize(90,90);
  pictures.resize(90,90);
  glass.resize(90,90);
  blackHat.resize(90,90);
    
  psalms.resize(90,90);
  belly.resize(90,90);
  candy.resize(90,90);
  mixed.resize(90,90);
  sushi.resize(90,90);
    
  tree.resize(90,90);
  tux.resize(90,90);
  yes.resize(90,90);
  speech.resize(90,90);
  dress.resize(90,90);
    
  cell.resize(90,90);
  dance.resize(90,90);
  iyh.resize(90,90);
  flower.resize(90,90);
  aisle.resize(90,90);
  
  fire.resize(90,90);
  third.resize(90,90);
  groom.resize(90,90);
  kids.resize(90,90);
  chassid.resize(90,90);
  
  openBar2 = loadImage ("weddingbingopressed-02.jpg");
  danceInjury2 = loadImage ("weddingbingopressed-03.jpg");
  pictures2 = loadImage ("weddingbingopressed-04.jpg");
  glass2 = loadImage ("weddingbingopressed-05.jpg");
  blackHat2 = loadImage ("weddingbingopressed-06.jpg");
  
  psalms2 = loadImage ("weddingbingopressed-07.jpg");
  belly2 = loadImage ("weddingbingopressed-08.jpg");
  candy2 = loadImage ("weddingbingopressed-09.jpg");
  mixed2 = loadImage ("weddingbingopressed-10.jpg");
  sushi2 = loadImage ("weddingbingopressed-11.jpg");
  
  tree2 = loadImage ("weddingbingopressed-12.jpg");
  tux2 = loadImage ("weddingbingopressed-13.jpg");
  yes2 = loadImage ("weddingbingopressed-14.jpg");
  speech2 = loadImage ("weddingbingopressed-15.jpg");
  dress2 = loadImage ("weddingbingopressed-16.jpg");
  
  cell2 = loadImage ("weddingbingopressed-17.jpg");
  dance2 = loadImage ("weddingbingopressed-18.jpg");
  iyh2 = loadImage ("weddingbingopressed-19.jpg");
  flower2 = loadImage ("weddingbingopressed-20.jpg");
  aisle2 = loadImage ("weddingbingopressed-21.jpg");
  
  fire2 = loadImage ("weddingbingopressed-22.jpg");
  third2 = loadImage ("weddingbingopressed-23.jpg");
  groom2 = loadImage ("weddingbingopressed-24.jpg");
  kids2 = loadImage ("weddingbingopressed-25.jpg");
  chassid2 = loadImage ("weddingbingopressed-26.jpg");
  
  openBar2.resize(90,90);
  danceInjury2.resize(90,90);
  pictures2.resize(90,90);
  glass2.resize(90,90);
  blackHat2.resize(90,90);
    
  psalms2.resize(90,90);
  belly2.resize(90,90);
  candy2.resize(90,90);
  mixed2.resize(90,90);
  sushi2.resize(90,90);
    
  tree2.resize(90,90);
  tux2.resize(90,90);
  yes2.resize(90,90);
  speech2.resize(90,90);
  dress2.resize(90,90);
    
  cell2.resize(90,90);
  dance2.resize(90,90);
  iyh2.resize(90,90);
  flower2.resize(90,90);
  aisle2.resize(90,90);
  
  fire2.resize(90,90);
  third2.resize(90,90);
  groom2.resize(90,90);
  kids2.resize(90,90);
  chassid2.resize(90,90);
  
  background(255);
  image(open, 0 ,0);
}

void draw(){
  
  if (mousePressed){
    fill(255);
    rect(0,0,width,height);
    
    image(top, 0, 0);
    image(bottom,0,647);
    
    image(openBar,15,184);
    image(danceInjury,110,184);
    image(pictures,210,184);
    image(glass,310,184);
    image(blackHat,410,184);
    
    image(psalms,15,276);
    image(belly,110,276);
    image(candy,210,276);
    image(mixed,310,276);
    image(sushi,410,276);
    
    image(tree,15,368);
    image(tux,110,368);
    image(yes,210,368);
    image(speech,310,368);
    image(dress,410,368);
    
    image(cell,15,460);
    image(dance,110,460);
    image(iyh,210,460);
    image(flower,310,460);
    image(aisle,410,460);
    
    image(fire,15,552);
    image(third,110,552);
    image(groom,210,552);
    image(kids,310,552);
    image(chassid,410,552);
  }
    
   /* for(int i = 20; i < 420; i+=95){
      image(openBar,i,184);
      openBar.resize(90,90);
      image(danceInjury,i,184);
      danceInjury.resize(90,90);
    }*/
   /* this is to press spacebar to return to first screen
   if (key == ' ') {
    image(open,0,0);
  } */
  if (mouseX > 15 && mouseX < 105 && mouseY > 184 && mouseY < 270){
    if(mousePressed){
      image(openBar2,15,184);
    }
  } 
  if (mouseX > 15 && mouseX < 105 && mouseY > 276 && mouseY < 366){
    if(mousePressed){
      image(psalms2,15,276);
    }
  }
   if (mouseX > 15 && mouseX < 105 && mouseY > 368 && mouseY < 458){
    if(mousePressed){
      image(tree2,15,368);
    }
   }
   if (mouseX > 15 && mouseX < 105 && mouseY > 460 && mouseY < 550){
    if(mousePressed){
      image(cell2,15,460);
    }
   }
   if (mouseX > 15 && mouseX < 105 && mouseY > 552 && mouseY < 642){
    if(mousePressed){
      image(fire2,15,552);
    }
   }
   
   
   if (mouseX > 110 && mouseX < 200 && mouseY > 184 && mouseY < 270){
    if(mousePressed){
      image(danceInjury2,110,184);
    }
  } 
  if (mouseX > 110 && mouseX < 200 && mouseY > 276 && mouseY < 366){
    if(mousePressed){
      image(belly2,110,276);
    }
  }
   if (mouseX > 110 && mouseX < 200 && mouseY > 368 && mouseY < 458){
    if(mousePressed){
      image(tux2,110,368);
    }
   }
   if (mouseX > 110 && mouseX < 200 && mouseY > 460 && mouseY < 550){
    if(mousePressed){
      image(dance2,110,460);
    }
   }
   if (mouseX > 110 && mouseX < 200 && mouseY > 552 && mouseY < 642){
    if(mousePressed){
      image(third2,110,552);
    }
   }
   
   
   if (mouseX > 210 && mouseX < 300 && mouseY > 184 && mouseY < 270){
    if(mousePressed){
      image(pictures2,210,184);
    }
  } 
  if (mouseX > 210 && mouseX < 300 && mouseY > 276 && mouseY < 366){
    if(mousePressed){
      image(candy2,210,276);
    }
  }
   if (mouseX > 210 && mouseX < 300 && mouseY > 368 && mouseY < 458){
    if(mousePressed){
      image(yes2,210,368);
    }
   }
   if (mouseX > 210 && mouseX < 300 && mouseY > 460 && mouseY < 550){
    if(mousePressed){
      image(iyh2,210,460);
    }
   }
   if (mouseX > 210 && mouseX < 300 && mouseY > 552 && mouseY < 642){
    if(mousePressed){
      image(groom2,210,552);
    }
   }
   
   if (mouseX > 310 && mouseX < 400 && mouseY > 184 && mouseY < 270){
    if(mousePressed){
      image(glass2,310,184);
    }
  } 
  if (mouseX > 310 && mouseX < 400 && mouseY > 276 && mouseY < 366){
    if(mousePressed){
      image(mixed2,310,276);
    }
  }
   if (mouseX > 310 && mouseX < 400 && mouseY > 368 && mouseY < 458){
    if(mousePressed){
      image(speech2,310,368);
    }
   }
   if (mouseX > 310 && mouseX < 400 && mouseY > 460 && mouseY < 550){
    if(mousePressed){
      image(flower2,310,460);
    }
   }
   if (mouseX > 310 && mouseX < 400 && mouseY > 552 && mouseY < 642){
    if(mousePressed){
      image(kids2,310,552);
    }
   }
   
  if (mouseX > 410 && mouseX < 500 && mouseY > 184 && mouseY < 270){
    if(mousePressed){
      image(blackHat2,410,184);
    }
  } 
  if (mouseX > 410 && mouseX < 500 && mouseY > 276 && mouseY < 366){
    if(mousePressed){
      image(sushi2,410,276);
    }
  }
   if (mouseX > 410 && mouseX < 500 && mouseY > 368 && mouseY < 458){
    if(mousePressed){
      image(dress2,410,368);
    }
   }
   if (mouseX > 410 && mouseX < 500 && mouseY > 460 && mouseY < 550){
    if(mousePressed){
      image(aisle2,410,460);
    }
   }
   if (mouseX > 410 && mouseX < 500 && mouseY > 552 && mouseY < 642){
    if(mousePressed){
      image(chassid2,410,552);
    }
   }
}
      

//void mouseClicked(){
  //count = 1;
//}

/*void keyPressed() {
}

void drawWingo(){
}*/


