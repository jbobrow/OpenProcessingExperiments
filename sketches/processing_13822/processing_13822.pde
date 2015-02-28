
void setup(){
  size(400,600);
}
 
void draw(){
  for (float a=800; a>200; a=a-5)
  {
    strokeWeight (a*23);
    ellipse(200,200,1000000%a,a);
  }
  for(float a=800; a<5; a=a-80)
  {
    strokeWeight (a*6000);
    ellipse(400,200,a,80%a);
  }
}
       
   
//짤리는 레몬입니다
//여기선 안보여요 ㅜㅜㅜㅜ

//로세싱에선 보이는데 여기서 왜 안보이는지 해결이 잘 안됩니다 ㅠㅠ

//파일은 보내놨어요 ㅠ  
