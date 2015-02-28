
int monstertjeX;
int monstertjeY;
int richting;
int teller;
boolean test;

void setup() {
  size(200, 200);
  //monstertjeX = 100;//aan doen voor alleen omhoog
  monstertjeY = 100;
  richting=9;
  teller=0;
}

void draw () {

if(test == true) {
  fill(0);
  } else {
  fill(255,0,0);
  }



    //monstertjeY = monstertjeY -1;     dit is van boven naar beneden
    //monstertjeX = mouseX; //toch bewegen links/rechts




    background(255);


    stroke(1);

    ellipseMode(CENTER);
    ellipse (monstertjeX-40, monstertjeY-60, 20, 50); //oor links


    ellipse (monstertjeX+40, monstertjeY-60, 20, 50); //oor rechts


    ellipse (monstertjeX-40, monstertjeY-60, 10, 20); //binnen oor links


    ellipse (monstertjeX+40, monstertjeY-60, 10, 20); //binnen oor rechts



    strokeWeight(2);
    noStroke();
    ellipse (monstertjeX, monstertjeY+10, 120, 160); //lichaam
    rect (monstertjeX-60, monstertjeY+20, 120, 70);  //lichaam



    stroke(1);
    strokeWeight(2);




    strokeWeight(1);
    
if(test == true) {
  fill(0);
  } else {
  fill(100,0,0);
  }
    ellipse(monstertjeX, monstertjeY, 70, 20);   //mond


  ;if(test == true) {
  fill(0);
  } else {
  fill(255);
  }
    rect(monstertjeX-10, monstertjeY-10, 10, 10); //tand
    rect(monstertjeX, monstertjeY-10, 10, 10);//tand
    rect(monstertjeX+10, monstertjeY-9, 10, 10);//tand
    rect(monstertjeX-20, monstertjeY-9, 10, 10);//tand


    fill(0);
    ellipse(monstertjeX+30, monstertjeY-30, 5, 20); //oog rechts

    ellipse(monstertjeX-20, monstertjeY-30, 5, 20); //oog links

    strokeWeight(2);
if(test == true) {
  fill(0);
  } else {
  fill(255,0,0);
  }
    ellipse(monstertjeX-40, monstertjeY+90, 70, 10);//linkervoet
    ellipse(monstertjeX+40, monstertjeY+90, 70, 10);//rechtervoet

    ellipse (monstertjeX-50, monstertjeY+20, 40, 10); //arm links
    ellipse (monstertjeX+50, monstertjeY+20, 40, 10); //arm rechts
  
  
    monstertjeX=monstertjeX+richting;

//als monstertje de rand raakt dan omkeren
  if (monstertjeX > width ||monstertjeX<0){ 
    richting=-richting;


  
    if (teller==10) {
      teller=0;
      test=!test;
    }
    

    teller = teller+1;
        println(teller);

  }
}
