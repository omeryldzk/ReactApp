import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom'; 
import api from '../api';

const AccountDetail = () => {
  const { id, acc_id } = useParams();
  const [account, setAccount] = useState(null);
  const navigate = useNavigate(); 

  useEffect(() => {
    api.get(`/users/${id}/accounts/${acc_id}`)
      .then(response => setAccount(response.data))
      .catch(error => console.error(error));
  }, [id, acc_id]);

  const handleDelete = () => {
    if (window.confirm('Are you sure you want to delete this account?')) {
      api.delete(`/users/${id}/accounts/${acc_id}`)
        .then(() => {
          alert('Account deleted successfully!'); // Optional: Inform user of success
          navigate(`/users/${id}/accounts`); // Navigate back to account list
        })
        .catch(error => {
          console.error('Error deleting account:', error);
          alert('Failed to delete account.'); // Optional: Inform user of failure
        });
    }
  };

  if (!account) return <div>Loading...</div>;

  return (
    <div className="container mt-4">
      <h2>Account Details</h2>
      <p><strong>Account ID:</strong> {account.acc_id}</p>
      <p><strong>Total Credit:</strong> {account.totalCredit}</p>
      <button onClick={handleDelete} className="btn btn-danger">Delete Account</button>
    </div>
  );
};

export default AccountDetail;
