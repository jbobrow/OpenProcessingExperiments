
/*
based on code found here:
http://www.openprocessing.org/visuals/?visualID=3628
Thanks Joe McKay!
possible improvements: 
show time=done
show value of keyed letter=done
change background color as score increases=done
provide more feedback done (but with problems in layout) :(
if error, lose time
show RGB values
share your score with XYZ via web or email
game always starts with same letter / need to randomize that

other ideas:
load text files to practice
matching game... load name of chem and type symbol
scrolling typing game... letters fall, type them before they hit

*/
int l=97;
//int l=random (97,122); this does not work
// game always starts with 'c'(l=99;), this the value of 99? Where can I find the values of the various keys? How does it apply to diff languages?

int s=0;
void setup()
{
  size(400,400);//size of screen
  textFont(createFont("",25));//not sure what this does
}

void draw()
{
background(s*2,s*2,s*3);// incrementally change background colors as score increases
//background(l);
char c=char(l);
text("type this letter: "+c,width*.1,height*.2);//text(stringdata, x, y, width, height)
text("this is your score " +s,10,30);//text(data, x, y)
text ("time in ms: "+ millis(), width*.15, height*.9);
text ("value of letter: " +l,width*.15,height *.8);//shows the value of the letter
if(millis()< 30000&&key==c)//30 seconds
  {l=int(random(97,122));s++;}//here is where the score gets added! s++
       //random(low, high)
if (s<10){
  text ("You should practice.",width*.15, height *.7);
  }

if (s>11){
  text ("doing better",width*.15, height *.7);
  }


if (s>30){
  text ("typing is your strong point",width*.15, height *.7);
}

if (s>40){
  text ("great",width*.15, height *.7);
}
if (s>45){
  text ("near the top!",width*.15, height *.7);
}



}


