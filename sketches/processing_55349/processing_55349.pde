
class Link {
	Tweet t1;
	Tweet t2;
	public Link(Tweet t1,Tweet t2){
		this.t1=t1;
		this.t2=t2;

	}
	
	
	void draw(){
		strokeWeight(8);
		stroke(t2.user.linkColor);
		line(t1.pos.x,t1.pos.y,t2.pos.x,t2.pos.y);
	}
}

