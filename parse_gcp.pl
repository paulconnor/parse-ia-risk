use strict; 
use warnings;
 

# "[2021-03-16 21:09:15.994][INFO][TID=8C0D8684848675A4] [CIP=240.0.131.13] [RID=38123ea0058d46c49d0e306e251a9411] [JH=26119585] [OP=evaluateRisk] [UID=1102811173] EvaluateRiskResponse{RequestId=38123ea0058d46c49d0e306e251a9411,IsRisky=false,RiskScore=33,RiskThreshold=50,RiskReason=Behavior anomaly,PolicyVersion=1.0,EventId=26085697614,RequestContext.UserID=1102811173,RequestContext.IP=103.95.2.127,RequestContext.VipAccount=26119585,RequestContext.UserAgent=Mozilla/5.0 (Linux; Android 11; SM-G988B Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.90 Mobile Safari/537.36,RequestContext.IpLocation.Country=UNKNOWN,RequestContext.IpLocation.State=UNKNOWN,RequestContext.IpLocation.City=UNKNOWN,RequestContext.IpLocation.Latitude=-1.0,RequestContext.IpLocation.Longitude=-1.0,device.expired::::false,device.match.method::::TAG_MATCH,device.match.reason.code::::EXACT_MATCH,device.registered::::true,device.registered.reason::::Registered device detected: registered device, 
# effort=0,device.shared::::false,location.ip.coordinates::::-1.0,-1.0,location.ip.country.state.city::::UNKNOWN/UNKNOWN/UNKNOWN,be.anomaly::::true,be.score::::0.9,be.score.reason::::Exact match with known anomaly,device.matched.tag::::542e7a97afa5b3be54a2e56ae6df1c4b1926be24,device.norton.mid::::,device.reason::::registered device, effort=0,input.userid::::1102811173,input.vipaccount::::26119585,re.initialize.currlocation.info::::UNKNOWN/UNKNOWN/UNKNOWN:[-1.0,-1.0],re.initialize.preveventid::::26080863954,re.riskreasons.codes::::ANOM_BHVR,rulestack.1::::Device recognition: registered device, effort=0. Added -1.00 (-25.00/100.00#4),rulestack.2::::Behavior anomaly:  ANOMALY: Exact match with known anomaly. Added 3.60 (0.90/1.00#4),score.actual::::2.60,score.mapping::::[0.0, 50.0]->[0.0, 4.0],50.0=4.0,[50.0, 100.0]->[4.0, 12.0],score.threshold::::4.00,}


#      
my $file_to_be_read = $ARGV[0] or die; 
#        
#        # Reading the file 
open(my $data_file, '<', $file_to_be_read) or die; 

print "timestamp,userId,jhash,operation,deviceExpired,DeviceMatchMethod,deviceMatchResonCode,deviceRegistered,deviceRegisteredReason,deviceShared,beAnomaly,beScore,beScoreReason,deviceReason,requestId,isRisky,riskScore,riskThreshold,riskReason,rule1,rule2,rule3,rule4\n";

while (my $row = <$data_file>) {
    chomp $row;
#print "timestamp=";
    my $timestamp = $row;
    if ($timestamp =~ /^\"\[(.*)\]\[INFO/) { print $1, "," ;} else { print ",";}

#print "\nuserId=";
    my $userId = $row;
    if ($userId =~ /(.*)\[UID=(.*)\] Eva/) { print $2, "," ;} else { print ",";}

#print "\njhash=";
    my $jhash = $row;
    if ($jhash =~ /(.*)\[JH=(.*)\] \[OP=/) { print $2, "," ;} else { print ",";}

#print "\noperation=";
    my $operation = $row;
    if ($operation =~ /(.*)\[OP=(.*)\] \[UID=/) { print $2, "," ;} else { print ",";}

#print "\ndeviceExpired=";
    my $deviceExpired  = $row;
    if ($deviceExpired =~ /(.*)device.expired::::(.*)\,device.expired.reason/) 
       { print $2, "," ;} 
    else 
    {
       if ($deviceExpired =~ /(.*)device.expired::::(.*)\,device.fingerprint.changes/) 
          { print $2, "," ;} 
       else 
       {
          if ($deviceExpired =~ /(.*)device.expired::::(.*)\,device.match.method/) 
             { print $2, "," ;} 
          else 
             { print ",";}
       }
    }

#print "\ndeviceMatchMethod=";
    my $deviceMatchMethod  = $row;
    if ($deviceMatchMethod =~ /(.*)device.match.method::::(.*)\,device.match.reason.code/) 
       { print $2, "," ;} 
    else 
    {
       if ($deviceMatchMethod =~ /(.*)device.match.method::::(.*)\,device.registered::::/) { print $2, "," ;} else { print ",";}
    }

#print "\ndeviceMatchReasonCode=";
    my $deviceMatchReasonCode  = $row;
    if ($deviceMatchReasonCode =~ /(.*)device.match.reason.code::::(.*)\,device.registered::::/) { print $2, "," ;} else { print ",";}

#print "\ndeviceRegistered=";
    my $deviceRegistered  = $row;
    if ($deviceRegistered =~ /(.*)device.registered::::(.*)\,device.registered.reason/) { print $2, "," ;} else { print ",";}

#print "\ndeviceRegisteredReason=";
    my $deviceRegisteredReason  = $row;
    if ($deviceRegisteredReason =~ /(.*)device.registered.reason::::(.*)\, effort=[012],device.shared/) { print $2, "," ;} else { print ",";}

#print "\ndeviceShared=";
    my $deviceShared  = $row;
    if ($deviceShared =~ /(.*)device.shared::::(.*)\,device.tag::::/) 
       { print $2, "," ;}
    else 
    {
       if ($deviceShared =~ /(.*)device.shared::::(.*)\,location.ip.coordinates/) { print $2, "," ;} else { print ",";}
    }

#print "\nbeAnomaly=";
    my $beAnomaly  = $row;
    if ($beAnomaly =~ /(.*)be.anomaly::::(.*)\,be.score::::/) { print $2, "," ;} else { print ",";}

#print "\nbeScore=";
    my $beScore  = $row;
    if ($beScore =~ /(.*)be.score::::(.*)\,be.score.reason/) { print $2, "," ;} else { print ",";}

#print "\nbeScoreReason=";
    my $beScoreReason  = $row;
    if ($beScoreReason =~ /(.*)be.score.reason::::(.*)\,device.issued.raw.tag/) 
       { my $str = $2; $str =~ s/,/;/g; print $str, "," ;}
    else 
    {
       if ($beScoreReason =~ /(.*)be.score.reason::::(.*)\,device.matched.tag/) { my $str = $2; $str =~ s/,/;/g; print $str, "," ;} else { print ",";}
    }

#print "\ndeviceReason=";
    my $deviceReason  = $row;
    if ($deviceReason =~ /(.*)device.reason::::(.*)\, effort=[012],input.userid/) { print $2, "," ;} else { print ",";}

#print "\n";
   my $requestId = $row;
   if ($requestId =~ /(.*)RequestId=(.*)\,IsRisky/) { print $2, "," ;} else { print ",";}

   my $isRisky = $row;
   if ($isRisky =~ /(.*)IsRisky=(.*)\,RiskScore/) { print $2, "," ;} else { print ",";}

   my $riskScore = $row;
   if ($riskScore =~ /(.*)RiskScore=(.*)\,RiskThreshold/) { print $2, "," ;} else { print ",";}

   my $riskThreshold = $row;
   if ($riskThreshold =~ /(.*)RiskThreshold=(.*)\,RiskReason/) { print $2, "," ;} else { print ",";}

   my $riskReason = $row;
   if ($riskReason =~ /(.*)RiskReason=(.*)\,PolicyVersion/) { $riskReason = $2; $riskReason =~ s/,/-/g; print $riskReason, "," ;} else { print ",";}

   my $rule1 = $row;
   if ($rule1 =~ /(.*)rulestack.1::::([^,]+)/) { print $2, "," ;} else { print ",";}
   if ($rule1 =~ /(.*)rulestack.2::::([^,]+)/) 
   { 
      if ($rule1 =~ /(.*)rulestack.2::::Enhanced([^,]+),([^,]+),([^,]+),/) 
      {
         print "Enhanced Difficult Travel," ;
      } else {
         print $2, "," ;
      }
   } else 
   { 
      print ",";
   }
   if ($rule1 =~ /(.*)rulestack.3::::([^,]+)/) 
   { 
      if ($rule1 =~ /(.*)rulestack.3::::Enhanced([^,]+),([^,]+),([^,]+),/) 
      {
         print "Enhanced Difficult Travel," ;
      } else {
         print $2, "," ;
      }
   } else 
   { 
      print ",";
   }
   if ($rule1 =~ /(.*)rulestack.4::::([^,]+)/) 
   { 
      print $2, "" ;
   } else { 
      if ($rule1 =~ /(.*)rulestack.(\d)::::Enhanced([^,]+),([^,]+),([^,]+),/)
      { 
         print $3, "-",$4 , "-" , $5 ;
      } else { 
         print "";
      }
   }
   print "\n";

} 
