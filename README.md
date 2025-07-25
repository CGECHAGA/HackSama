Chuma
https://green-flow-money.lovable.app/
Chuma Pesa Project Documentation
Last Updated: [25th /7/2025]
Version: 1.0.0

1. Executive Summary
Problem Statement:

38.1M Kenyans lose 11%+ of transaction value to high fees (CBK 2024)

82% have unused airtime (avg. 50 KES/month) with no conversion utility

1.4M boda riders lack affordable insurance (IRA 2024)

Solution:

USSD/App Platform (*789#):

0.5% money transfers

Airtime-to-investments (min. 50 KES)

Pay-as-you-go boda insurance (5 KES/day)

Key Differentiator:
First CMA-approved platform monetizing idle airtime via regulated investments.

Core Components
Module	                  Tech Stack	            Description
USSD Gateway	    Africa’s Talking API	        Handles *789# menu logic
Airtine Converter	Python + Telkom API	            90% airtime-to-cash rate
Investment Engine	Node.js + CMA Broker API	    Executes stock/bond orders
Insurance Claims	Flutter + GPS/Image AI	        Processes boda accident claims

Database Schema:

sql
CREATE TABLE users (
    user_id VARCHAR(12) PRIMARY KEY, -- Format: 2547XXXXXXXX
    airtime_balance DECIMAL(10,2),
    investment_portfolio JSONB -- { "safaricom_shares": 0.5 }
);

CREATE TABLE transactions (
    tx_id SERIAL PRIMARY KEY,
    user_id VARCHAR(12) REFERENCES users(user_id),
    type ENUM('transfer', 'investment', 'insurance'),
    fee DECIMAL(10,2)
);

3. Business Model
Revenue Streams
Stream      	      Monetization	               Margin
Transfers	          0.5% fee             	       85%
Airtime Arbitrage	  Buy@80%, Sell@90%   	       10%
Insurance	          10% premium cut	           70%
USSD                  Ksh 50                       5%

Projections (Year 1):

500K users → $24M revenue → $15.6M gross profit (65% margin)

4. Compliance & Legal

Required Licenses
CBK: Payment Service Provider (PSP)

CMA: 3rd Party Investment Agent

IRA: Microinsurance Underwriter

Data Protection:

GDPR/Kenya Data Protection Act compliance

AES-256 encryption for all TXs

5. User Flows

Money Transfer
User dials *789# → Selects "Send Money"

Enters amount (min. 10 KES) → Recipient number

Confirms fee (e.g., "Send 100 KES? Fee: 0.50 KES")

Receives SMS receipt

Airtime Investment

6. Marketing Assets
Brand Guidelines
Primary Color: #2E8B57 ("Chuma Green")

Logo Usage: Min. 20px clearance space

Voice: "Huslter-friendly, expert-backed"

Sample Campaign:

Radio Ad Script:
*"Piga *789# kuweka airtime yako kwa pension! Bei ya M-Pesa, faida yako!"*

7. Risk Management

Risk	Mitigation
Telkom API failure	Fallback to Airtel Money API
CMA license delay	Pilot under sandbox (6 months)
Fraudulent claims	GPS + image AI verification

8. Appendices
API Documentation: api.chuma.ke/docs

Regulatory Filings: CBK/CMA application templates

Pilot Data: 600-user test results (Retention, TX volume)

