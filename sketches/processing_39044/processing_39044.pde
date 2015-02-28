
//Hashgrid Class////////////////////////////////////////////////////////////////////
//Further explanations here: http://www.openprocessing.org/visuals/?visualID=34290//
////////////////////////////////////////////////////////////////////////////////////

class hashGrid {          
  
HashMap<String,LinkedList> H;
float bucketSize;

  hashGrid (float bucketSize){
    this.bucketSize=bucketSize;
    H=new HashMap();
  }

  int getXr (PVector pos) {
    return int(floor(pos.x/bucketSize));  
  }
  
  int getYr (PVector pos) {
    return int(floor(pos.y/bucketSize));
  }
  
  String getKey (PVector pos){
    if(pos==null) {
      return "";
    }else{
      return str(getXr(pos))+str(getYr(pos));
    }
  }
  
  void clear(){
    H.clear(); 
  }
  
  void update(P p){
     if (p.l==null){
       return;
     }else{
       String hkey=getKey(p.l);
       if (H.get(hkey)==null){
         LinkedList vl=new LinkedList();
         vl.add(p);
         H.put(hkey,vl);
       }else{
         LinkedList vl= H.get(hkey);
         vl.add(p);
       }
     }
  }
  
  LinkedList check(P p){
    if (p.l==null){
      return null; 
    }else{
      int Xr=getXr(p.l);
      int Yr=getYr(p.l);
      String[] keys=new String[9];
      int in=0;
      for (int xr=Xr-1;xr<=Xr+1;xr++){
        for (int yr=Yr-1;yr<=Yr+1;yr++){
          PVector c=new PVector(xr,yr);
          keys[in++]=str(xr)+str(yr);
        }
      }
      LinkedList checked= new LinkedList();
      for (int i=0;i<keys.length;i++){     
        if(H.get(keys[i])!=null) checked.addAll(H.get(keys[i]));
      }  
      return checked;
    }
  }

}


