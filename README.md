# HackSama
HackSama Documentation
Version 1.0
A SDG-Aligned Hackathon Platform

1. Introduction
About 
HackSama is a hackathon management platform infused with Japanese ethos—where respect ( ‘sama’) meets innovation. Designed for universities, NGOs, and corporations, it streamlines SDG-aligned hackathons with real-time collaboration, impact tracking, and AI-assisted judging. More than a tool, it’s a movement to transform hackathons into engines of global change

System Overview
A web-based platform to organize, manage, and track hackathons focused on solving challenges tied to the UN Sustainable Development Goals (SDGs).

Key Features
Multi-Role Access (Admin, Participants, Judges, Mentors)

SDG-Themed Hackathon Creation

Team Formation & Collaboration Tools

Submission & Judging Portal

Analytics & Impact Tracking (e.g., # of SDG-aligned solutions generated)

User Roles & Access
Role	Access Level	Permissions
Admin	Full control	- Create/manage hackathons
- Approve/reject participants
- Assign judges/mentors
- Monitor submissions & analytics
Participants	Limited access	- Register for hackathons
- Form teams
- Submit projects
- Collaborate via chat/forums
Judges/Mentors	Semi-restricted	- Review submissions
- Provide feedback/scores
- Mentor teams (optional)
Public (Guests)	View-only	- Browse past hackathons
- See winning solutions
How It Works

1. Admin Workflow
Creates a Hackathon:

Sets theme (e.g., "SDG 7: Affordable Clean Energy Hackathon").

Defines rules, timelines, and judging criteria.

Manages Registrations:

Approves/rejects participants (if private).

Onboards judges/mentors.

Monitors Progress:

Tracks submissions, team activity, and judging results.

Generates reports on SDG impact (e.g., "50+ solutions for clean energy submitted").

 Participant Workflow
Registers for a hackathon (individually or as a team).

Collaborates using built-in tools (chat, Git integration, video calls).

Submits project (code, demo, pitch deck) before deadline.

Receives feedback from judges.

 Judge/Mentor Workflow
Reviews submissions based on criteria (innovation, feasibility, SDG alignment).

Scores projects and provides feedback.

Mentors (optional) guide teams during the hackathon.

 Public Access (Optional)
View past hackathons, winning projects, and SDG impact metrics.

Encourages transparency and inspires future participation.

Technical Implementation
Frontend: React.js / Vue.js (responsive UI)

Backend: Node.js/Django (handles registrations, submissions, judging)

Database: PostgreSQL/MongoDB (stores user data, projects, scores)

Collaboration Tools: Firebase/WebSockets (real-time chat, notifications)

Deployment: AWS/Heroku (scalable for large hackathons)

SDG Integration
Hackathon Themes: Each event aligns with 1+ SDGs (e.g., "Zero Hunger," "Climate Action").

Impact Dashboard: Shows how many solutions address each SDG.

Post-Hackathon Support: Connects winners with NGOs/incubators for real-world implementation.



1.1 Purpose
HackSama streamlines hackathon management with:

SDG-focused project tracking (UN Sustainable Development Goals).

All-in-one collaboration (teams, submissions, judging).

Cultural branding (Japanese-inspired design).

1.2 Target Audience
Admins: Universities/NGOs hosting hackathons.

Participants: Developers, designers, activists.

Judges: Mentors, corporate sponsors.

2. System Architecture
2.1 Tech Stack
Component	             Technology	                        Purpose
Frontend	              React Native	                    Cross-platform mobile app
Backend                	Node.js + Express	                REST API
Database	           Firebase Firestore	                Real-time data sync
Auth	               Firebase Auth	                                    Google/GitHub login
SDG API	              UN Stats API	                                    Tag projects to SDGs
2.2 Data Flow
![alt text](<data flow.png>)


3. Features
3.1 
User                    Roles
Role	            Permissions
Admin	            Create events, assign judges, analytics
Participant      	Join teams, submit projects, chat
Judge	            Review submissions, score, give feedback
3.2 Core Functionality
SDG Tagging
Projects are auto-tagged to SDGs using keywords (e.g., "solar" → SDG 7).

javascript
// Example: SDG detection logic  
const sdgKeywords = {  
  "SDG 7": ["energy", "solar", "renewable"],  
  "SDG 4": ["education", "school", "e-learning"]  
};  
Real-Time Chat
Firebase WebSockets power team messaging.

Judging Portal
Rubric: Scores (1-5) for Innovation, Feasibility, SDG Alignment.

4. Setup Guide
4.1 Prerequisites
Node.js v16+, Firebase account, Expo CLI (for mobile).

4.2 Installation
bash
# Clone repo  
git clone   

# Install dependencies  
cd hacksama  
npm install  

# Configure Firebase  
echo "API_KEY=your_firebase_key" > .env  

# Run app (iOS/Android)  
expo start  
4.3 Deployment
Web: npm run build → Deploy /build to Vercel.

Mobile: expo publish → Distribute via TestFlight/Play Store.

5. API Reference
5.1 Endpoints
Endpoint	Method	Description
/api/hackathons	GET	List all hackathons
/api/teams/join	POST	Join/create a team
/api/judging/:id	POST	Submit scores
Example Request:

javascript
fetch('/api/hackathons', {  
  method: 'GET',  
  headers: { 'Authorization': 'Bearer YOUR_TOKEN' }  
});  
6. User Manual
6.1 For Participants
Register → Pick a hackathon.

Form teams → Invite via email.

Submit → Upload code + 1-min pitch.

6.2 For Admins
Create Event → Set SDG theme, rules.

Monitor → Live analytics dashboard.

7. Troubleshooting
Issue	Solution
Firebase auth fails	Check .env API keys
SDG tags not applying	Update keywords in sdgKeywords.js

