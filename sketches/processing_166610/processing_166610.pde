
PShape a,s,d,f;

void setup(){
  fill(0);
  textSize(22);
  
  background(155);
    
  size(720,500);
   a = loadShape("bunnystuff.svg");
   s = loadShape("bunnystuff2-01.svg");
   d = loadShape("bunnystuff3-01.svg");
   f = loadShape("bunnystuff4.svg");
   fill(0);
   
   text(" a = bunny, s = happy bunny, d = sad bunny, f = fancy bunny",28,460);

}
void draw(){
  smooth();
fill(0);
  textSize(22);
   if (key == 'a'|| key == 'A'){
     background(155);
  shape(a);
}
   if (key == 's'|| key == 'S'){
     background(155);
  shape(s);
}
   if (key == 'd'|| key == 'D'){
     background(155);
  shape(d);
}
   if (key == 'f'|| key == 'F'){
     text(" a = bunny, s = happy bunny, d = sad bunny, f = fancy bunny",28,460);
     background(155);
  shape(f);
}
if (key == 'a'|| key == 'A'){
     text(" a = bunny, s = happy bunny, d = sad bunny, f = fancy bunny",28,460);
}
if (key == 's'|| key == 'S'){
     text(" a = bunny, s = happy bunny, d = sad bunny, f = fancy bunny",28,460);
}
if (key == 'd'|| key == 'D'){
     text(" a = bunny, s = happy bunny, d = sad bunny, f = fancy bunny",28,460);
}
if (key == 'f'|| key == 'F'){
     text(" a = bunny, s = happy bunny, d = sad bunny, f = fancy bunny",28,460);
}

}



