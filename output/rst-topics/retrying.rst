Retrying
--------

There are cases in which you should keep retrying to scan a file, for example when you get the status **IN_PROGRESS**  for a file. This status means that someone uploaded that file and it is being analyzed in the cloud. In this case, you should use the returned **ttl**  value as a "retry after ttl seconds" measure. Likewise, if your application itself uploads a file, the same process applies. Limits should be set for the number of retries, for the maximum **ttl**  value to be taken into consideration (for example, "do not retry after 1 week, if ttl says so"), etc.

