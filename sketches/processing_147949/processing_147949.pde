
long lastTime = 0;
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16;
int x = 1000;
void setup() {
  size (2126,650);

  img1 = loadImage("0.PNG");
  img2 = loadImage("1.PNG");
  img3 = loadImage("2.PNG");
  img4 = loadImage("3.PNG"); 
  img5 = loadImage("4.PNG"); 
  img6 = loadImage("5.PNG");
  img7 = loadImage("6.PNG");
  img8 = loadImage("7.PNG");
  img9 = loadImage("8.PNG");
  img10 = loadImage("9.PNG");
  img11 = loadImage("10.PNG");
  img12 = loadImage("11.PNG");
  img13 = loadImage("12.PNG");
  img14 = loadImage("13.PNG");
  img15 = loadImage("14.PNG");
  background(255);




  lastTime = millis();
}
void draw() {


  if ( millis() - lastTime <= 1000 ) {
    println( "1 seconds" );
    image(img15, 0, 0);

    }
    
  
  else if ( millis() - lastTime > 1000 &&  millis() - lastTime <= 2000   )
    {
    println( "2 seconds" );
    image(img2, 0, 0);
    }
    


  else if ( millis() - lastTime > 2000 &&  millis() - lastTime <= 3000   )
    {
    println( "3 seconds" );
    image(img3, 0, 0);
}

    
  else if ( millis() - lastTime > 3000 &&  millis() - lastTime <= 4000   )
    {
    println( "4 seconds" );
    image(img4, 0, 0);}


  else if ( millis() - lastTime > 4000 &&  millis() - lastTime <= 5000   )
    {
    println( "5 seconds" );
    image(img5, 0, 0);}

  else if ( millis() - lastTime > 5000 &&  millis() - lastTime <= 6000   )
    {
    println( "6 seconds" );
    image(img6, 0, 0);
}

  else if ( millis() - lastTime > 6000 &&  millis() - lastTime <= 7000   )
    {
    println( "7 seconds" );
    image(img7, 0, 0);
    }

  else if ( millis() - lastTime > 7000 &&  millis() - lastTime <= 8000   )
    {
    println( "8 seconds" );
    image(img8, 0, 0);
    }

  else if ( millis() - lastTime > 8000 &&  millis() - lastTime <= 9000   )
    {
    println( "9 seconds" );
    image(img9, 0, 0);
    }

  else if ( millis() - lastTime > 9000 &&  millis() - lastTime <= 10000   )
    {
    println( "10 seconds" );
    image(img10, 0, 0);
    }

  else if ( millis() - lastTime > 10000 &&  millis() - lastTime <= 11000   )
    {
    println( "11 seconds" );
    image(img11, 0, 0);
    }

  else if ( millis() - lastTime > 11000 &&  millis() - lastTime <= 12000   )
    {
    println( "12 seconds" );
    image(img12, 0, 0);
    }

  else if ( millis() - lastTime > 12000 &&  millis() - lastTime <= 13000   )
    {
    println( "13 seconds" );
    image(img13, 0, 0);
    }

  else if ( millis() - lastTime > 13000 &&  millis() - lastTime <= 14000   )
    {
    println( "14 seconds" );
    image(img14, 0, 0);
    }

  else if ( millis() - lastTime > 14000 &&  millis() - lastTime <= 14200   )
    {
    println( "15 seconds" );
    image(img15, 0, 0);
    }  
    
    else if ( millis() - lastTime > 14200 &&  millis() - lastTime <= 15000   )
    {
    println( "16 seconds" );
    background(255);
    }
 
    else if ( millis() - lastTime > 15000 &&  millis() - lastTime <= 15200  )
    {
        lastTime = millis();
        println( "reset" );
    }
    }


