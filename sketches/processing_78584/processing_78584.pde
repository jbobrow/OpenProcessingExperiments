
void setup()

{
size(600,600);
}



void draw()
{
background(255, 255, 255);
line(100,500,500,500); //X Axis line
line(100,500,100,100); //  Y Axis line 
fill(#000000);

text("This graph shows that the older you get, the worse long term memory you have",50,60);
text("Age",500,510);
text("Memory", 40, 300);

text("18-20",100,515);
text("21-28",175,515);
text("62-68",250,515);
text("72-80",320,515);
text("80+",400,515);

// key stuff
text("Key:", 190,550);
text("Long Term Memory",270,550)
text("Short Term Memory",270,570);

fill(#308BCE);
rect(240,540,10,10);

fill(255,0,0);
rect(240,560,10,10);

//rectangle co-ordinates and colours etc
//rect 18-20
fill(#308BCE);
rect(105,500,10,-250);
fill(255,0,0);
rect(120,500,10,-200);


// rect 21-28
fill(#308BCE);
rect(180,500,10,-210);
fill(255,0,0);
rect(195,500,10,-190);


//rect 62-68
fill(#308BCE);
rect(255,500,10,-170);
fill(255,0,0);
rect(270,500,10,-150);


//rect 72-80
fill(#308BCE);
rect(325,500,10,-140);
fill(255,0,0);
rect(340,500,10,-110);


//rect 80+
fill(#308BCE);
rect(395,500,10,-95);
fill(255,0,0);
rect(410,500,10,-80);

}
