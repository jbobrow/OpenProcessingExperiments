
class Event{
int a;
int lb, rb;


Event(int left_boundry, int right_boundry){
lb = constrain(left_boundry,0,width);
rb = constrain(right_boundry,0,width);

}


void check(){

if(myAvatar.xpos>lb && myAvatar.xpos<rb){
  println("oy");
}
}

}



