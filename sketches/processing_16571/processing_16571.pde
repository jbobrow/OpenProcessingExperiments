
class Particle{
	PVector position;
	PVector velocity;
	float gravity;
	color c;

	Particle(PVector p, float g, color c_){
		position = p.get();
		gravity = g;
		velocity = new PVector();
		c = c_;
	}

	void update(){
		switch(gravity_direction){
		case 0:
			if(position.x < EDGE){
				velocity.x += gravity;
			}
			break;
		case 2:
			if(position.y < EDGE){
				velocity.y += gravity;
			}
			break;
		case 4:
			if(position.z < EDGE){
				velocity.z += gravity;
			}
			break;
		case 1:
			if(position.x > -EDGE){
				velocity.x -= gravity;
			}
			break;
		case 3:
			if(position.y > -EDGE){
				velocity.y -= gravity;
			}
			break;
		case 5:
			if(position.z > -EDGE){
				velocity.z -= gravity;
			}
			break;
		}
		

		if(abs(velocity.x) < 0.1){
			velocity.x = 0;
		}
		if(abs(velocity.y) < 0.1){
			velocity.y = 0;
		}
		if(abs(velocity.z) < 0.1){
			velocity.z = 0;
		}
		
		position.add(velocity);
		
		if(position.x > EDGE || position.x < -EDGE){
			velocity.x = -velocity.x * reflection;
			if(position.x > EDGE){
				position.x -= position.x - EDGE;
			}else{
				position.x -= position.x + EDGE;
			}
			
		}
		if(position.y > EDGE  || position.y < -EDGE){
			velocity.y = -velocity.y * reflection;
			if(position.y > EDGE){
				position.y -= position.y - EDGE;
			}else{
				position.y -= position.y + EDGE;
			}
			
		}
		if(position.z > EDGE || position.z < -EDGE){
			velocity.z = -velocity.z * reflection;
			if(position.z > EDGE){
				position.z -= position.z - EDGE;
			}else{
				position.z -= position.z + EDGE;
			}
		}
		
	}

	void draw(){
		strokeWeight(4);
		stroke(c);
		point(position.x, position.y, position.z);
	}
}

