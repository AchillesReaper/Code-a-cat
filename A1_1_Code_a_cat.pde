// A1: code a cat

//control of size
float size = 0.8;

//control of tail length [200,500]
float tailLength = 400;

//starting point of the cat
float centerX;
float centerY;

void setup() {
  size(800, 800);
  noLoop();
  centerX = width/2;
  centerY = height/2+100*size;
}

void draw() {
  background(204);
  noFill();
  fill(255, 160, 220);
  float[] nosePoint = drawNose();
  noFill();
  drawMouth(nosePoint[0], nosePoint[1], 'L');
  drawMouth(nosePoint[0], nosePoint[1], 'R');
  drawEye('L');
  drawEye('R');
  fill(255, 255, 255);
  drawPaw('L');
  drawPaw('R');
  drawHead();
  drawEar('L');
  drawEar('R');
  drawBeard('L');
  drawBeard('R');
  drawBody();
  //stroke(255, 255, 255);
  drawTail();
}

void mousePressed() {
  redraw();
}

void drawTail() {
  float tailStartX = centerX;
  float tailStartY = centerY - 198*size;
  strokeWeight(20*size);
  beginShape();
  vertex(tailStartX, tailStartY);
  float x1 = tailStartX;
  float y1 = tailStartY-20;
  float x2 = random(tailStartX - 100*size, tailStartX + 100*size);
  float x3 = random(tailStartX - 100*size, tailStartX + 100*size);
  float y2 = random(tailStartY - tailLength/5*size, tailStartY - tailLength/2*size);
  float y3 = random(tailStartY - tailLength/4*size, tailStartY - tailLength*size);
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
}

void drawBody() {
  arc(centerX, centerY, 380*size, 380*size, radians(230), radians(310));
}

void drawBeard(char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  float sx1 = centerX + 120*Direction*size;
  float sy1 = centerY;
  float ex1 = centerX + 200*Direction*size;
  float ey1 = centerY - 30*size;

  float sx2 = centerX + 130*Direction*size;
  float sy2 = centerY + 20*size;
  float ex2 = centerX + 220*Direction*size;
  float ey2 = centerY + 40*size;



  line(sx1, sy1, ex1, ey1);
  line(sx2, sy2, ex2, ey2);
}

void drawEar(char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  beginShape();
  float startPointX = centerX + 75*Direction*size;
  float startPointY = centerY - 115*size;
  vertex(startPointX, startPointY);
  float x1 = centerX + 180*Direction*size;
  float x2 = centerX + 200*Direction*size;
  float x3 = centerX + 160*Direction*size;
  float y1 = centerY - 180*size;
  float y2 = centerY - 180*size;
  float y3 = centerY - 55*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
}


void drawHead() {
  //chin
  noFill();
  arc(centerX, centerY, 350*size, 320*size, QUARTER_PI*1.39, QUARTER_PI*2.61);
  arc(centerX, centerY, 380*size, 250*size, QUARTER_PI*5.5, QUARTER_PI*6.5);
  arc(centerX, centerY+30*size, 400*size, 280*size, QUARTER_PI*7.2, QUARTER_PI*8.75);
  arc(centerX, centerY+30*size, 400*size, 280*size, QUARTER_PI*3.25, QUARTER_PI*4.8);
}


void drawPaw(char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  float pawX = centerX + 120*Direction*size;
  float pawY = centerY + 120*size;
  circle(pawX, pawY, 90*size);
  line(pawX-15*size, pawY+10*size, pawX-15*size, pawY+42*size);
  line(pawX+15*size, pawY+10*size, pawX+15*size, pawY+42*size);
}

void drawEye(char LR) {
  int Direction;
  float adjustment;
  if (LR == 'L') {
    Direction = -1;
    adjustment = 9;
  } else {
    Direction = 1;
    adjustment = 0;
  }
  noFill();
  float POx = centerX + 80*Direction*size;
  float POy = centerY;
  arc(POx, POy, 100*size, 80*size, QUARTER_PI*(4.5+adjustment), PI+QUARTER_PI*(2.5+adjustment));
}

void drawMouth(float noseEndX, float noseEndY, char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  line(noseEndX, noseEndY, noseEndX, noseEndY+30*size);
  beginShape();
  vertex(noseEndX, noseEndY+30*size);
  float x1 = noseEndX;
  float y1 = noseEndY + 80*size;
  float x2 = noseEndX + 60*Direction*size;
  float y2 = noseEndY + 80*size;
  float x3 = noseEndX + 60*Direction*size;
  float y3 = noseEndY + 30*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
}

float[] drawNose() {
  strokeWeight(3);
  beginShape();
  float[] startPoint = new float[2];
  startPoint[0] = centerX;
  startPoint[1] = centerY + 40*size;
  vertex(startPoint[0], startPoint[1]);
  float x1 = centerX - 100*size;
  float x2 = centerX + 100*size;
  float x3 = centerX;
  float y1 = centerY - 20*size;
  float y2 = centerY - 20*size;
  float y3 = centerY + 40*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
  return startPoint;
}
