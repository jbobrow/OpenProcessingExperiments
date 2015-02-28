

class List extends ArrayList{
  
  Object last(){
    if(size() == 0) return null;
    return get(size()-1);
  }
  
  Object first(){
    if(size()==0) return null;
    return get(0);
  }

}

