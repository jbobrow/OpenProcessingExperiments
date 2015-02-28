
//declare a variable to contain whole numbers, 자주쓰는 숫자 정해놓기
//wormsize라는 단어를 변수로 지정하기
int wormsize = 10;
//wormgrowthrate라는 말을 변수로 지정하기
int wormgrowthrate = 1;
void setup(){
  size(800  ,300);
  
}
void draw(){
  background(200);  
//width 와 height 사이즈가 바뀌어도 사이즈에 맞게 변형된다는 특징  
  line(0, height/2, wormsize, height /2);
//wormsize를 wormgrowthrate씩 자라게 하기    
    //wormsize = wormsize + wormgrowthrate;    
//줄어들고 늘어나는 변수를 랜덤으로(!부터4까지)
wormsize = wormsize + int(random(1,4));
//if와 else: if가 뭐라면 뭐를 해라 그렇지않으면(else) 이걸해라
//else if : 이게되면 이걸해라
//양쪽 끝에 닿으면 방향 바꾸기
 if(wormsize>=width){
  wormgrowthrate = -1;
} else if (wormsize<=0){
  wormgrowthrate = 1;
}

}
//마우스를 클릭 했을대 웜사이즈를 다시 10으로 만들기
void mouseClicked(){
  wormsize = 10;
}
