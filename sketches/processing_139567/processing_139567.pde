
float upper=3600*24*365*200;  //upper limit
float lower=0;                //lower limit
//the answer must be between upper and lower limits....
float x;
float h;
float result;
float delta;  //difference in input
float target=((0.95*1370*(1-0.32))-(4*204))/(4*2.17); //what are you trying to get to?
float margin=0.0001; //how close do you want to get?


//specific variables for this
float b=2.17;
float ce=2.08*pow(10,8);
float tstart=((1370*(1-0.32))-(4*204))/(4*2.17);



void draw(){
  x=(upper+lower)/2;
  result=target-((target-tstart)*exp(-(b/ce)*x)); //change this to the equation/maths you are using! 
  
  if (result<target){  //if too high
   delta=abs(upper-x);
   upper=x;            //input = new upper limit
  }
  else if (result>target){  //if too low
    delta=abs(x-lower);
    lower=x;                //input = new lower limit
  }
  
  println("          x="+x);
  println("     result="+result);
  println("diff="+delta);
  
  
  if (abs(result-target)<margin){    //if the output is within the margin
    noLoop();
    println();
    println();
    println("Final Result");
    println("************");
    println("x= "+x);        //input
    println("result=  "+result);  //output!!!
    println("Years=   "+(x/(3600*24*365.25)));  //for conversion from seconds
    println("months=   "+(x/(3600*24*365.25))*12);    //for conversion from seconds
    exit();
  }
    
}
