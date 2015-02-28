
class beeHive {
   ArrayList beeList; 
  
   beeHive(){
     beeList = new ArrayList();
   } 
   
   void addBee(int numBees){
    float prob = 0;
    for(int i = 0; i < numBees; i++){
        prob = random(1);
        if(prob <= .35){
          beeList.add(new maleBee());
        }
        else{
          beeList.add(new femaleBee()); 
        }
    }
   }
   
   void flyBee(){
     for(int i = 0; i < beeList.size(); i++){
        bee sample = (bee)beeList.get(i);
        sample.render();
        sample.hum();
        if(sample.isDead()){
           beeList.remove(i);
        }  
     }
   }     
}

