
void initAgent()
{
  agent_sprite = loadImage("sprite_agent.png");
  cacheAgent(); // Generate image array for our manager ;)

  int[] rand_pos = randomGridPos(); // Random starting location  
  pos_x = rand_pos[0] - (width*0.5 - 0.5*local2world)*world2local; // Random starting x
  pos_y = rand_pos[1] - (height*0.5 - 0.5*local2world)*world2local; // Random starting y
  index_x = rand_pos[0]; // Grid x index
  index_y = rand_pos[1]; // Grid y index

  // Assigns a collision body to the manager ;)
  agentAABB = new AABB(width*0.5 - 0.15*local2world, height*0.5, 0.25*local2world, 0.4*local2world, int(g_width*0.5), int(g_height*0.5));
}

void cacheAgent()
{
  walk = new PImage[4*frame_count];
  agent_sprite.loadPixels();
  
  // Store manager sprite ;)
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < frame_count; i++) {
      walk[i + j*frame_count] = agent_sprite.get(j*48, (i/4)*48, 48, 48);
    }
  }
}

void renderAgent()
{
  // Render the manager ;)
  switch (direction) {
    case 0: if (keys[w]) image(walk[frameCount%frame_count + 0*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world);
            else image(walk[0*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world); // Up and standing still
            break;
    case 1: if (keys[a]) image(walk[frameCount%frame_count + 1*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world);
            else image(walk[1*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world); // Left and standing still
            break;
    case 2: if (keys[s]) image(walk[frameCount%frame_count + 2*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world);
            else image(walk[2*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world); // Down and standing still
            break;
    case 3: if (keys[d]) image(walk[frameCount%frame_count + 3*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world);
            else image(walk[3*frame_count], width*0.5 - 0.5*local2world, height*0.5 - 0.5*local2world, local2world, local2world); // Right and standing still
            break;
  }
}

void renderAgentShadow()
{
  for (LightMap lightsrc: lightsources) {
    for (ShadowMap shade: lightsrc.agentshadows) {
      shade.render();
    }
  }
}

