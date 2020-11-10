
#!/bin/bash

# A DNS enumerator script
NC='\033[0m' # No Color
GREEN='\033[0;32m'
RED='\033[0;31m'

if [ "$#" -ne 1 ]; then
    printf "${RED} Error : Please specify the domain you want to Enumerate...\n${NC}"
    exit 0
fi
printf "${GREEN}++++++Gathering Information using  NSLOOKUP command +++++ ${NC}\n"
printf "${GREEN} NsLookup queries the specified DNS server and retrieves the requested records that are associated with the domain name you provided.\n ${NC}"
sleep 2

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN} Querying  A records: the IPv4 address of the domain.${NC}\n"
sleep 5
nslookup -type=A $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n"
printf "${GREEN} Querying  AAAA records: the IPv6 address of the domain.${NC}\n "
sleep 5
nslookup -type=AAAA $1

printf " \n +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf  "${GREEN} Querying CNAME records: the canonical name — allowing one domain name to map on to another. This allows more than one website to refer to a single web server.${NC}\n"
sleep 5
nslookup -type=CNAME $1

printf  "\n +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n"
printf "${GREEN} Querying HINFO  records:An HINFO record is a type of Resource Record that gives the operating system and architecture for the specified host.${NC}\n"
sleep 5
nslookup -type=HINFO $1

printf "\n +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN} Querying MB record : MB: Specifies a mailbox domain name. i.e domain name in email address \n${NC}"
sleep 5
nslookup -type=MB $1

printf "\n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n"
printf "${GREEN} Querying MG record : MG: Specifies a mail group member.${NC}\n "
sleep 5
nslookup -type=MG $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN} Querying MX record : MX: Specifies a mail EXCHANGER. A mail exchanger record (MX record) specifies the mail server responsible for accepting email messages on behalf of a domain name.  It is possible to configure several MX records, typically pointing to an array of mail servers for load balancing and redundancy.${NC}\n "
sleep 5
nslookup -type=MX $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN} Querying NS record : NS-records identify the DNS servers responsible (authoritative) for a zone. A zone should contain one NS-record for each of its own DNS servers (primary and secondaries). This is mostly used for zone transfer purposes (notify messages). These NS-records have the same name as the zone in which they are located. .${NC}\n "
sleep 5
nslookup -type=NS $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN} Querying PTR records: A pointer (PTR) record is a type of Domain Name System (DNS) record that resolves an IP address to a domain or host name, unlike an A record which points a domain name to an IP address. PTR records are used for the reverse DNS lookup. Using the IP address, you can get the associated domain or host name.${NC}\n "
sleep 5
nslookup -type=PTR $1


printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN} Querying TXT records: TXT records are a type of Domain Name System (DNS) record that contains text information for sources outside of your domain. You add these records to your domain settings. You can use TXT records for various purposes. Google uses them to verify domain ownership and to ensure email security..${NC}\n "
sleep 5
nslookup -type=TXT $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN}++++++Gathering Information using HOST command +++++ ${NC}\n"
sleep 5
host -a $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN}++++++Gathering Information using DIG command +++++ ${NC}\n"
sleep 5
dig -type=ANY $1

printf " \n ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
printf "${GREEN}++++++Gathering Information using WHOIS command +++++ ${NC}\n"
sleep 5
whois $1




