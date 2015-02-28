
void setup() {
  love("my_road","your_road","you&me");
}
void love(String y, String m, String l){
  if(y!=m) l.split("&");
  love(y,m,l);
}

