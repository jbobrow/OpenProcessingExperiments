
class Link{
  PageNode start, end;
  
  Link(PageNode st, PageNode end){
    this.start = st;
    this.end = end;
  }
  
  PageNode getStart(){
    return start;
  }
  
  PageNode getEnd(){
    return end;
  }
}

