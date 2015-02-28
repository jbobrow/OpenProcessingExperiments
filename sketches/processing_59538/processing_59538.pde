
class PlaceMarker {  



  String slideText = "SLIDESHOW";
  String videoText = "VIDEO";

  String name;  
  float lat;  
  float lng;  
  float nx, ny; 
  float x, y;
  int num;
  int death;
  float r;
  float v;
  String info;
  boolean pmp = false;
  boolean engaged = false;
  int clickCounter = 0;


  float g=0;
  float t=200;
  float gg=0;
  float tt=200;
  float ggg=0;
  float ttt=200;


  PlaceMarker(String name, float lat, float lng, int num, int death, String info) 
  {  
    this.name = name;  
    this.lat = lat;  
    this.lng = lng;
    this.num = num;
    this.death = death;
    this.info = info;
  }  

  void display()
  {  
    // Equirectangular projection  
    x = map(lng, 70, 140, 194, 855);   
    y = map(lat, 60, 14, 97, 623); 
    r = map(num, 20, 100000, 15, 40);
    v = map(death, 0, 200, 100, 40);

    x += nx;
    y += ny;

    noStroke();  
    fill(360, 100, v, 50);  
    ellipse(x, y, r, r);  
    fill(360, 100, v, 200);  
    ellipse(x, y, r/2, r/2);
  }  

  void update(int i)
  {
    nx = map(noise(millis()/4000.0+i), 0, 1, -5, 5);
    ny = map(noise(millis()/3500.0), 0, 1, -5, 5);
  }

  int fc;
  void checkOver()
  { 
    x = map(lng, 70, 140, 194, 855);   
    y = map(lat, 60, 14, 97, 623); 
    r = map(num, 20, 300000, 10, 30);
    v = map(death, 0, 200, 100, 40);



    if ( dist(mouseX, mouseY, x, y) < 6 ) 
    { 
      target();

      pushMatrix();
      noStroke();
      fill(0, 0, 0, 100);
      rect(mouseX, mouseY, textWidth(name), 25);
      fill(0, 0, 100);
      text(name, mouseX+15, mouseY+15);
      popMatrix();

      //Here, we already know we're over the ellipse
      //So we'll check actual pressing now
      if (mousePressed && pmp==false && engaged==false)
      { 
        engaged = true;
        println("engaged");
        fc = frameCount;
      }
      if (mousePressed && pmp==false && engaged==true && fc!=frameCount)
      {
        engaged=false;
        println("Disengaged");
      }
    }

    pmp = mousePressed;
    popUp();
  }



  void target()
  {
    x = map(lng, 70, 140, 194, 855);   
    y = map(lat, 60, 14, 97, 623); 

    noFill();
    strokeWeight(0.5);

    stroke(0, 0, 0, t); 
    ellipse(x, y, g, g);


    g+=1;
    t-=2;

    if (g > 15)
    {
      stroke(0, 0, 0, tt);
      ellipse(x, y, gg, gg);
      gg +=1;
      tt -=2;

      if (gg>15)
      {
        stroke(0, 0, 0, ttt);
        ellipse(x, y, ggg, ggg);
        ggg +=1;
        ttt -=2;
      }
    }


    if (g>100)
    {
      g=0;
      t=200;
    }
    if (gg>100)
    {
      gg=0;
      tt=200;
    }
    if (ggg>100)
    {
      ggg=0;
      ttt=200;
    }
  }

  void popUp()
  {
    if (engaged)
    {
      noStroke();
      if (x<=500)
      {
        pushMatrix();
        //grey shield
        fill(20, 0, 100, 130);
        rect(10, 10, 360, 700);
        //info:text
        fill(0, 0, 0, 180);
        text(info, 35, 300, 320, 700);
        popMatrix();
      }
      else if ((x<=600) && (y<=400))
      {
        pushMatrix();

        fill(20, 0, 100, 180);
        rect(380, 10, 360, 700);

        fill(0, 0, 0, 180);
        text(info, 400, 50, 320, 700);
        popMatrix();
      }
         else if ((x<=600) && (y>400))
      {
        pushMatrix();

        fill(20, 0, 100, 180);
        rect(380, 10, 360, 700);

        fill(0, 0, 0, 180);
        text(info, 400, 300, 320, 700);
        popMatrix();
      }
      else if ((x<width) && (y<=400))
      {
        pushMatrix();

        fill(20, 0,100, 200);
        rect(750, 10, 320, 700);

        fill(0, 0, 0, 180);
        text(info, 770, 50, 280, 700);
        popMatrix();
      }
         else if ((x<width) && (y>400))
      {
        pushMatrix();

        fill(20, 0,100, 200);
        rect(750, 10, 320, 700);

        fill(0, 0, 0, 180);
        text(info, 770, 300, 280, 700);
        popMatrix();
      }
    }
  }



  String toString()
  {  
    return name + " (" + lat + ", " + lng + ")";
  }
}


