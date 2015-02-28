
int t = 0 ;
boolean flag = true ;
void draw() {
  if(t==254) flag = false ;
  else if(t==0) flag = true ;
  t += flag ? 1 : -1 ;
  background(255, t % 255, 150) ;
}

