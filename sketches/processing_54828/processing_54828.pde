
class Link {
	Tweet t1;
	Tweet t2;
	public Link(Tweet t1,Tweet t2){
		this.t1=t1;
		this.t2=t2;
	}
	void draw(){
		line(t1.pos.x,t1.pos.y,t2.pos.x,t2.pos.y);
	}
}

