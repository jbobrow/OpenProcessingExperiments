
// This drawing makes me happy because even if it is very simple and
// really has nothing to do with what I ultimately want to make,
// designing through programming is starting to make some sense to me.
// I love the way every new command to learn has such grand effects.
// http://builtecology.wordpress.com/2011/05/18/processing-drawing-1/

size (300, 200);
background (0);
smooth ();
noStroke ();
float r = random (5, 55);
float r2 = random (5, 55);
for (int x=0; x<width; x+=r) {
  for (int y=0; y<width; y+=r2){

    for (float s = random (10, 255); s<255; s+=s){
  fill (107, s, s);

rect (x, y, 20, 20);
y+=10;
rotate (PI/8);


}
}
}
