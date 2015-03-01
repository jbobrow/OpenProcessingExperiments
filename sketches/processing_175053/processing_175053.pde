
void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);

  translate(0, 60);



  if (second()%2==0&&mousePressed==true)              //Bei gerader Sekundenanzahl
  {
    translate(0, 30);             //wird der Wasserspiegel gesenkt


    pushMatrix(); //_______________________________________WASSERMATRIX_1________
    for (int j=0; j<50; j+=10)        //Anzahl der Zeilen
    {
      translate(-100, 20);
      for (int i=0; i<6; i+=1)      //Anzahl der "WELLE"n auf einer Zeile
      {
        translate(55*2, 0);
        fill(0, 0, 255-(j*6)); 
        textSize(15); 
        text("WELLE", 0, 0);
      }
      translate(-560, 0);          //zurücksetzen des Cursors
    }
    popMatrix(); //________________________________________WASSERMATRIX_1_ENDE____

    pushMatrix(); //_______________________________________WASSERMATRIX_2_______
    translate(0, 20);
    for (int j=0; j<50; j+=10)        //Anzahl der Zeilen
    {
      translate(-45, 20);
      for (int i=0; i<6; i+=1)      //Anzahl der "WELLE"n auf einer Zeile
      {
        translate(55*2, 0);
        fill(0, 0, 255-(j*6)); 
        textSize(15); 
        text("WELLE", 0, 0);
      }
      translate(-560-55, 0);          //zurücksetzen des Cursors
    }
    popMatrix(); //________________________________________WASSERMATRIX_2_ENDE____

    translate(0, 200);

    for (int blubbi=3; blubbi>0; blubbi-=1)
    {
      translate(100, 0);
      textSize(30);
      fill(#FF8827);
      text("FISCH", 0, 0);
    }
    println(mouseX);
  } else 
  {  
    pushMatrix(); //_______________________________________WASSERMATRIX________
    for (int j=0; j<50; j+=10)        //Anzahl der Zeilen
    {
      translate(-50, 20);
      for (int i=0; i<10; i+=1)      //Anzahl der "WELLE"n auf einer Zeile
      {
        translate(55, 0);
        fill(0, 0, 255-(j*6)); 
        textSize(15); 
        text("WELLE", 0, 0);
      }
      translate(-(50*10), 0);      //zurücksetzen des Cursors
    }
    popMatrix(); //________________________________________WASSERMATRIX ENDE____

    translate(0, 200);
    if (second()%2==0)
    {
      translate(0, 20);
    }
    for (int blubbi=3; blubbi>0; blubbi-=1)
    {
      translate(100, 0);
      textSize(30);
      fill(#FF8827);
      text("FISCH", 0, 0);
    }
  }
}

